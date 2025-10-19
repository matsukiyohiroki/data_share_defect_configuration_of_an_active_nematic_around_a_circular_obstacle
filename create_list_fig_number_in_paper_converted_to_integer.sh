#!/bin/bash

source list_fig_number_in_paper.txt

# 空文字以外のインデックスと値を取得
declare -a indices
declare -a values
for i in "${!fig_number_in_paper[@]}"; do
	if [ -n "${fig_number_in_paper[${i}]}" ]; then
		indices+=("$i")
		values+=("${fig_number_in_paper[${i}]}")
	fi
done
echo "${fig_number_in_paper[@]}"
echo "${indices[@]}"
echo "${values[@]}"

# 非空要素だけをソート（macOS向け）
sorted_values=($(
	printf "%s\n" "${values[@]}" \
		| sed -E 's/^([0-9]+)([a-zA-Z])$/\1 \2/' \
		| sort -k1,1n -k2,2 \
		| tr -d ' '
			))
echo "${fig_number_in_paper[@]}"
echo "${indices[@]}"
echo "${values[@]}"
echo "${sorted_values[@]}"

# 結果表示
: > list_fig_number_in_paper_converted_to_integer.txt
for ((i=0; i<${#fig_number_in_paper[@]}; i++));
do
	#printf 'array[%d]="%s"\n' "$i" "${array[i]}"
	if [ -n "${fig_number_in_paper[${i}]}" ]; then
		for ((k=0; k<${#sorted_values[@]}; k++));
		do
			#echo "${sorted_values[${k}]}"
			if [ "${fig_number_in_paper[${i}]}" = "${sorted_values[${k}]}" ]; then
				printf 'fig_number_in_paper[%d]="%d"\n' "${i}" "${k}"
			fi
		done
	else
		printf 'fig_number_in_paper[%d]=""\n' "$i"
	fi
done
