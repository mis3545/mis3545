import random
import csv


grades = [(x, y, z / 10) for x in range(1, 11)
          for y in range(1, 5) for z in range(20, 40)]

grades_sample = random.sample(grades, 20)

for i in range(20):
    line = '{}\t{}\t{}\t{}'.format(
        i + 1, grades_sample[i][0], grades_sample[i][1], grades_sample[i][2])
    print(line)


with open('grades.txt', 'w', newline='') as f:
    writer = csv.writer(f, delimiter='\t')
    for i in range(20):
        line = [i + 1, grades_sample[i][0],
                grades_sample[i][1], grades_sample[i][2]]
        writer.writerow(line)
