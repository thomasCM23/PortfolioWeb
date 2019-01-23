import tensorflow as tf
import numpy as np
import json
import functools

class TextGeneration():
    def __init__(self, start_string, num_generate, temp):
        self.start_string = start_string
        self.num_generate = num_generate
        self.temperature = temp
        tf.enable_eager_execution()
        self.vocab, self.char2idx, self.idx2char = get_vocab_char2idx_idx2char(vocab_file='data/vocab.json')
        self.model = build_model(len(self.vocab), batch_size=1)
        self.model.load_weights(tf.train.latest_checkpoint('checkpoint/text_generation'))
        self.model.build(tf.TensorShape([1, None]))

    def generate_text(self):
        input_eval = [self.char2idx[s] for s in self.start_string]
        input_eval = tf.expand_dims(input_eval, 0)

        text_generated = []

        self.model.reset_states()
        for i in range(self.num_generate):
            predictions = self.model(input_eval)
            predictions = tf.squeeze(predictions, 0)

            predictions = predictions / self.temperature
            predicted_id = tf.multinomial(predictions, num_samples=1)[-1, 0].numpy()
            input_eval = tf.expand_dims([predicted_id], 0)

            text_generated.append(self.idx2char[predicted_id])
        return self.start_string + ''.join(text_generated)


def build_model(vocab_size, embedding_dim=515, rnn_units=515, batch_size=64):
    RNN = functools.partial(
            tf.keras.layers.GRU, recurrent_activation='sigmoid')


    model = tf.keras.Sequential([
        tf.keras.layers.Embedding(vocab_size, embedding_dim, batch_input_shape=[batch_size, None]),
        RNN(rnn_units,
            return_sequences=True,
            recurrent_initializer='glorot_uniform',
            stateful=True),
        tf.keras.layers.Dropout(rate=0.1),
        RNN(rnn_units,
            return_sequences=True,
            recurrent_initializer='glorot_uniform',
            stateful=True),
        tf.keras.layers.Dropout(rate=0.1),
        RNN(rnn_units,
            return_sequences=True,
            recurrent_initializer='glorot_uniform',
            stateful=True),
        tf.keras.layers.Dropout(rate=0.1),
        RNN(rnn_units,
            return_sequences=True,
            recurrent_initializer='glorot_uniform',
            stateful=True),
        tf.keras.layers.Dropout(rate=0.1),
        # maybe add more
        tf.keras.layers.Dense(vocab_size)
    ])
    return model


def get_text(file_name='shakespeare.txt',
             origin='https://storage.googleapis.com/download.tensorflow.org/data/shakespeare.txt'):
    path_to_file = tf.keras.utils.get_file(file_name, origin)
    return open(path_to_file).read()


def get_vocab_char2idx_idx2char(text=None, vocab_file=None):
    if text is None:
        with open(vocab_file, 'r') as f:
            vocab = json.loads(f.read())
    else:
        vocab = sorted(set(text))
        vocab_file = 'data/vocab.json' if vocab_file is None else vocab_file
        with open(vocab_file, 'w') as fp:
            json.dump(vocab, fp)

    # mapping strings to numerical representation
    char2idx = {u: i for i, u in enumerate(vocab)}
    idx2char = np.array(vocab)
    return vocab, char2idx, idx2char
