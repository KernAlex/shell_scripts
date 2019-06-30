
#!/bin/bash

BACK=()
FORWARD=()
BACK_LEN=0
FORWARD_LEN=0

cd () {
	temp="$1"
	if [ -z "$temp" ]; then # no input.
     		temp=$HOME
    fi
    if [ ! -d "$temp" ]; then
   		echo "not a valid directory";
   		return 0
   	fi
   	if [[ $(builtin cd $temp; echo $PWD) = $PWD ]]; then
   		return 0
   	fi
   	BACK+=($PWD)
   	FORWARD_LEN=0
   	FORWARD=()
   	BACK_LEN=$((BACK_LEN + 1))
   	builtin cd ${temp}
   }

b() {
	if [[ $BACK_LEN == 0 ]]; then
		return 0
	fi
	BACK_LEN=$((BACK_LEN - 1))
	FORWARD_LEN=$((FORWARD_LEN + 1))
	FORWARD+=($PWD)
	builtin cd ${BACK[$BACK_LEN]}
	unset BACK[$BACK_LEN]

}

f() {
	if [[ $FORWARD_LEN == 0 ]]; then
		return 0
	fi
	BACK_LEN=$((BACK_LEN + 1))
	FORWARD_LEN=$((FORWARD_LEN - 1))
	BACK+=($PWD)
	builtin cd ${FORWARD[$FORWARD_LEN]}
	unset FORWARD[$FORWARD_LEN]
}
