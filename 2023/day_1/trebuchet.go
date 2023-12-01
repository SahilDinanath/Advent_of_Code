package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"
)

func main() {
	file, err := os.Open("./input.txt")

	if err != nil {
		log.Fatal(err)
	}

	scanner := bufio.NewScanner(file)

	numberWords := map[string]int{"one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9}
	var sum int

	for scanner.Scan() {
		line := scanner.Text()
		indexStart := 1000
		numberStart := 0
		numberEnd := 0
		indexEnd := -1

		for word, value := range numberWords {
			index := strings.Index(line, word)

			if index == -1 {
				continue
			}

			if index < indexStart {
				indexStart = index
				numberStart = value
			}

			index = strings.LastIndex(line, word)
			if index > indexEnd {
				indexEnd = index
				numberEnd = value
			}
		}

		for i, word := range line {
			if word > 57 || word < 48 {
				continue
			}
			if i < indexStart {
				indexStart = i
				numberStart = int(word) - 48
			}
			if i > indexEnd {
				indexEnd = i
				numberEnd = int(word) - 48
			}
		}

		sum += numberStart*10 + numberEnd
	}

	fmt.Println(sum)
}
