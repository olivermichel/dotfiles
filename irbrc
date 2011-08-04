require 'rubygems'

## Prompt
IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I => ">> ",
  :PROMPT_S => "%l>> ",
  :PROMPT_C => ".. ",
  :PROMPT_N => ".. ",
  :RETURN => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :CUSTOM
IRB.conf[:AUTO_INDENT] = true

require 'ap'

## Wirble
#require 'wirble'
#Wirble.init
#Wirble.colorize

alias q exit

# clear screen
def clear
  system 'clear'
end