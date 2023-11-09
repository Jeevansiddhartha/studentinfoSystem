using System;
using System.Text;

namespace Student_InformationSystem.Common
{
    public class Encrypt_Decrypt
    {
       
        public static string Encrypt(string plainText)
        {
            byte[] encData_byte = new byte[plainText.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(plainText);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }

        
        public static string Decrypt(string encryptedData)
        {
            UTF8Encoding encoder = new UTF8Encoding();
            Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(encryptedData);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            string result = new String(decoded_char);
            return result;
        }
    }
}