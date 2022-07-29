#Final Project
#
#This project will develop an encryption calculator capable of receiving a message (string)
#or text file with a string within it, and encrypt it according to the AES algorithm,
#such as encryption, bit size of the key and text output format.
#
#Alfredo Godínez  A01274993
#Angel Limones    A00825333
#22/07/2022

defmodule Encrypt do

  @moduledoc """
  Encrypt Calculator.
  """

  #AES: Advanced Encryption Standard
  #256: "256 Bit Key"
  #GCM: "Galois Counter Mode"
  @aad "AES256GCM"


  #Generates a random base64 encoded secret key.
  def execute_action([action: "generate_secret"]) do
    :crypto.strong_rand_bytes(16)
    |> :base64.encode
  end


  #Encrypts or decrypts and base64 encodes/decodes the given file with the secret key.
  def execute_action([file: file, action: action, key: key]) do
    file_contents = File.read!(file)
    apply(__MODULE__,String.to_atom(action), [file_contents, key])
    |> write_to_file(file, action)
  end


  #Write file encrypt
  def write_to_file(contents, file, "encrypt") do
    {:ok, file_pid } = File.open(file, [:write])
    IO.binwrite(file_pid, :base64.encode(contents))
    File.close(file_pid)
  end


  #Write file decrypt
  def write_to_file(contents, file, "decrypt") do
    {:ok, file_pid } = File.open(file, [:write])
    IO.binwrite(file_pid, contents)
    File.close(file_pid)
  end


  #Encrypts the given string of text with the given secret key
  def encrypt(val, key) do
    iv = :crypto.strong_rand_bytes(16)
    {ciphertext, tag} =
      :crypto.block_encrypt(:aes_gcm, decode_key(key), iv, {@aad, to_string(val), 16})
    iv <> tag <> ciphertext
  end


  #Decrypt the given string of text with the given secret key
  def decrypt(ciphertext, key) do
    ciphertext = :base64.decode(ciphertext)
    <<iv::binary-16, tag::binary-16, ciphertext::binary>> = ciphertext
    :crypto.block_decrypt(:aes_gcm, decode_key(key), iv, {@aad, ciphertext, tag})
  end


  #Decode key
  def decode_key(key) do
    :base64.decode(key)
  end

end
