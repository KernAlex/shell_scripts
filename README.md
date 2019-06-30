# shell_scripts
## nav.sh
I recommend changing the name to .nav.sh

1. Navigate to your home directory after downloading or copying folder into a file
2. Open up your .bash_profile (I use vim) and enter . ./(filename of script) as an entry (Note the space after the first period). exit the editor. for this I used  
`. ./.nav.sh`.
3. Make sure to make the file exicutible and type `chmod +x (filename of script)`. for this I used  
`chmod +x .nav.sh`
4. Restart your shell

Now cd works as normal, simply use it to move to any directory. Going back and fourth is as simple as entering b or f
