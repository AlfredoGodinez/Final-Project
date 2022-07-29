
# The Advanced Encryption calculator

**Instituto Tecnológico y de Estudios Superiores de Monterrey**

Final project

TC2006 Programming Languages

Gilberto Echeverría Furió


## Authors
- [José Alfredo Godínez Gasca](https://github.com/AlfredoGodinez)
- [Angel de Jesús Limones Quirino](https://github.com/C1TR0N5)



## Problem description
Proper management of cryptographic keys is essential for the effective use of cryptography for security. If an adversary knows a safe combination, the strongest safe does not provide security against penetration. Similarly, poor key management can easily compromise robust algorithms. As a combination of a safe, your encryption keys are only as good as the security you use to protect them. There are many encryption algorithms, all with different characteristics and in our project we will focus on the AES algorithm, to provide greater security when sending and receiving messages that we want to be encrypted and thus prevent their security from being vulnerable. AES is another symmetric encryption algorithm. It became popular for its good implementation on hardware as well as in restricted environments. Its characteristics are: Previously it was tested to withstand attacks. High computational and memory efficiency and low cost. Flexibility, easy implementation and simplicity. AES works with encryption rounds. Each round is a sequence of several processing steps, which could be a combination of substitution, transposition, and relationship building between the input raw text and the output. The number of applicable rounds varies with 10 rounds applied with 128-bit keys, 12 rounds for 192-bit keys, and 14 rounds for 256-bit keys. AES encryption uses table-based data replacement with rows and columns. The substitution rule is dictated by different parts of the encryption key. AES encryption uses table-based data replacement with rows and columns. The substitution rule is dictated by different parts of the encryption key. AES encryption uses table-based data replacement with rows and columns. The substitution rule is dictated by different parts of the encryption key.

## Project scope
Develop an advanced message encryptor based on the characteristics of the AES algorithm, using tools that help us implement it as recursion and functional programming.
The encryptor will be able to receive the text to be encrypted, the desired mode of encryption (ECB or CBC), the size of the key in bits and finally the secret key, in order to show the output of encrypted text according to the elements that were previously provided.

**AES offers 2 different modes of encryption: ECB and CBC.**

* ECB (Electronic Code Book) is the simplest encryption mode and does not require initialization vector for encryption. The input plain text will be divided into blocks and each block will be encrypted with the provided key and therefore the identical plaintext blocks will be encrypted in identical ciphertext blocks.

* CBC (Cipher Block Chaining) mode is highly recommended and is an advanced form of block encryption. It requires initialization vector to make each message unique, which means that identical plaintext blocks are encrypted in different ciphertext blocks. Therefore, it provides more robust encryption compared to ECB mode, but it is a bit slower compared to ECB mode. If an initialization vector is not entered, the default value will be used here for CBC mode and that default value is a zero-based byte.

## Proposed solution
Our proposal is to create a programm using elixir for encryption, where you can either enter plain text or a .txt file that you want to encrypt. Also you can either generate a random encryption key or use your own.
AES decryption has also the same process. By default, it assumes the entered text be in Base64. The input can be Base64 encoded or .txt file. And the final decrypted output will be Base64 string.
For the encryption/decryption process we will use the :crypto module that is already integrated in Erlang's environment, which supports the AES encryption algorithm and will help us to create modules that automatically encrypt and decrypt the data.

## Topics used
* Functional programming: The concepts of functional programming will be used for the encryption analyzer to be developed, this will facilitate the implementation since the functional strategy offers a series of useful advantages when it comes to the code design of an analyzer. Thanks to the higher-order functions and the clarity of the program code, even large collections of data can be easily managed.
* Recursion: The recursion is a topic of utmost importance since to achieve the change of the text to encrypted code the recursion will be our greatest ally.
* File I/O (Optional): If time permits, file handling will be included in order to receive the text through a file and be able to encrypt it.

## How to run
1. Open terminal inside the project directory.
2. `mix deps.get` <- Install required dependencies.
3. `iex -S mix` <- Start Interactive Elixir.
4. `secret = Encrypt.generate_secret` <- Generate secret key in variable "secret".
5. `ciphertext = Encrypt.encrypt("Hola mundo", secret)` <- Call the function, sending the text to be encrypted as the first parameter and the variable "secret" as the second parameter, the result saved in the variable "ciphertext".
6. ~/.mix/escripts/encrypt --file ./1_example.txt --action encrypt --key $ENCRYPTION_SECRET <- Encrypt a file:
7. ~/.mix/escripts/encrypt --file ./1_example_res.txt --action decrypt --key $ENCRYPTION_SECRET <- Decrypt  a file:

## Requirements
[Elixir](https://elixir-lang.org/install.html)
