#Final Project
#
#This project will develop an encryption calculator capable of receiving a message (string)
#or text file with a string within it, and encrypt it according to the user's decision,
#such as encryption, bit size of the key and text output format
#
#Alfredo Godínez
#A01274993
#21/07/2022

defmodule AES.Calculator do

    @doc """
  @aad "AES256GCM"
  ...
  def encrypt(val, key) do
    mode       = :aes_gcm
    secret_key = :base64.decode(key)
    iv         = :crypto.strong_rand_bytes(16)
    {ciphertext, ciphertag} = :crypto.block_encrypt(mode, secret_key, {@aad, to_string(val), 16})
    iv <> ciphertag <> ciphertext
    |> :base64.encode
  end
  """


  #CBC encrypt
  def encrypt(data, key) do
    :crypto.block_encrypt(:aes_ecb, key, pad(data, @aes_block_size))
  end

  # PKCS5Padding
  defp pad(data, block_size) do
    to_add = block_size - rem(byte_size(data), block_size)
    data <> :binary.copy(<<to_add>>, to_add)
  end

  def decrypt(data, key) do
    padded = :crypto.block_decrypt(:aes_ecb, key, data)
    unpad(padded)
  end

  defp unpad(data) do
    to_remove = :binary.last(data)
    :binary.part(data, 0, byte_size(data) - to_remove)
  end


end
