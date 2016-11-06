#!env bash

enable=(LID)

cat /proc/acpi/wakeup | while read line
do
	device=$(echo $line | cut -d " " -f 1)
	enabled=$(echo $line | cut -d " " -f 3)

	if [[ $device == "Device" ]]; then
		continue
	fi

	if ! [[ ${enable[*]} =~ "$device" ]]; then
		if [[ $enabled == "*enabled" ]]; then
			echo $device > /proc/acpi/wakeup
		fi
	fi

	if [[ ${enable[*]} =~ "$device" ]]; then
		if [[ $enabled == "*disabled" ]]; then
			echo $device > /proc/acpi/wakeup
		fi
	fi
done

