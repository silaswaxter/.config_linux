# Make modifications to $PATH using this file.
# EXPLANATION: When some applications, like rofi, are launched by the window 
# manager instead rather than a terminal, $PATH is not updated from the bash
# files like .bashrc and .bash_profile. Furthermore the setting of $PATH 
# should not be tied to a specific shell type.
PATH="${PATH}:${HOME}/.local/bin"
PATH="${PATH}:/usr/local/MATLAB/R2022b/bin"
PATH="${PATH}:/home/silas/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin"
PATH="${PATH}:/opt/logic-saleae"
PATH="${PATH}:/opt/VSCode-linux-x64"
PATH="${PATH}:/opt/stm32-cube-programmer/bin/"
PATH="${PATH}:/opt/"
. "$HOME/.cargo/env"

