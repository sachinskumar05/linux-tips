awk -v start='2021-02-10 08:00:00' -v end='2021-02-10 17:30:00' -v q="'" '
BEGIN{
    st="date -d" q start q " +%s"; st |getline start; close(st);
    ed="date -d" q end   q " +%s"; ed |getline end;   close(ed)
}
{ dt=$1" "$2; epoch="date -d" q dt q " +%s"; epoch |getline dt; close(epoch) };
(dt>=start && dt<=end)' my.log

