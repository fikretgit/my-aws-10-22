grep "Invalid user" auth.log | cut -d' ' -f8 | sort | uniq -c > invalid_user.sh

grep "Invalid user" auth.log | cut -d' ' -f9 | sort | uniq -c >> invalid_user.sh

than open invalid_user.sh and remove user and from lines.

cat invalid_user.sh | grep -v "from" | grep -v "user" > new_invalid_user.sh

or
grep -Eio "invalid user .+ " auth.log | awk '{print $3}' | sort | uniq -c > invalid_user.sh

or

grep -Eio "invalid user .+ \[" auth.log | awk '{print $3}' | sort | uniq -c > invalid_user.sh

or

grep -Eio "invalid user .+ [preauth]" auth.log | awk '{print $3}' | sort | uniq -c > invalid_user.sh
