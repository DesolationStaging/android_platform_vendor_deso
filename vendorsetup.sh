for combo in $(curl -s https://raw.githubusercontent.com/DesolationRom/build-targets/lp/deso-build-targets | sed -e 's/#.*$//' | awk {'print $1'})
do
 add_lunch_combo deso_$(echo $combo)-userdebug
done
