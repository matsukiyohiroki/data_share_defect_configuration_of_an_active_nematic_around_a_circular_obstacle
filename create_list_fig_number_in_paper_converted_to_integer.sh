#!/bin/bash

#数字＋アルファベットのFIG番号を取得
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

# 非空要素だけをソート（macOS向け）
sorted_values=($(
	printf "%s\n" "${values[@]}" \
		| sed -E 's/^([0-9]+)([a-zA-Z]*)$/\1 \2/' \
		| sort -k1,1n -k2,2 \
		| awk '{printf "%s%s\n", $1, $2}'
			))
echo "${sorted_values[@]}"

# 結果表示
: > list_fig_number_in_paper_converted_to_integer.txt
for ((i=0; i<${#fig_number_in_paper[@]}; i++));
do
	if [ -n "${fig_number_in_paper[${i}]}" ]; then
		for ((k=0; k<${#sorted_values[@]}; k++));
		do
			if [ "${fig_number_in_paper[${i}]}" = "${sorted_values[${k}]}" ]; then
				printf 'fig_number_in_paper_converted_to_integer[%d]="%d"\n' "${i}" "${k}" >> list_fig_number_in_paper_converted_to_integer.txt
			fi
		done
	else
		printf 'fig_number_in_paper_converted_to_integer[%d]=""\n' "$i"                            >> list_fig_number_in_paper_converted_to_integer.txt
	fi
done
