cifras = {
    'A' => 'Q',
    'B' => 'W',
    'C' => 'E',
    'D' => 'R',
    'E' => 'C',
    'F' => 'Y',
    'G' => 'U',
    'H' => 'I',
    'I' => 'H',
    'J' => 'P',
    'K' => 'Z',
    'L' => 'X',
    'M' => 'S',
    'N' => 'T',
    'O' => 'V',
    'P' => 'J',
    'Q' => 'A',
    'R' => 'D',
    'S' => 'M',
    'T' => 'N',
    'U' => 'G',
    'V' => 'O',
    'W' => 'B',
    'X' => 'L',
    'Y' => 'F',
    'Z' => 'K'
}

mensagem = "ATACARBASESUL"

msg_cifrada = []
mensagem.each_char  { |x|  msg_cifrada << cifras[x] }

msg_cifrada = msg_cifrada.join('')
puts "Mensagem Cifrada: " + msg_cifrada

msg_decifrada = []
msg_cifrada.each_char { |x| msg_decifrada << cifras[x] }

msg_decifrada = msg_decifrada.join('')
puts "Mensagem Decifrada: " + msg_decifrada
