function fish_prompt --description 'Write out the prompt'                        
     # virtualenv stuff
     if set -q VIRTUAL_ENV                                                        
         echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
     end                                                                          
     set -l last_status $status                                                   
                                                                                  
     if not set -q __fish_prompt_normal                                           
         set -g __fish_prompt_normal (set_color normal)                           
     end                                                                          
                                                                                  
     # PWD                                                                        
     set_color $fish_color_cwd                                                    
     echo -n (prompt_pwd)                                                         
     set_color normal                                                             
                                                                                  
     printf '%s ' (__fish_git_prompt)                                             
                                                                                  
     if not test $last_status -eq 0                                               
     set_color $fish_color_error                                                  
     end                                                                          
     
     # Set a pretty date                                                                             
     set_color -b black yellow                                                    
     echo -n '['(date "+%I:%M %P")']'                                             
     set_color normal                                                             

     echo -n ' $ '                                                                
                                                                                  
     set_color normal                                                             
end