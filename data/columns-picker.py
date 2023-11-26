import csv
import sys

def reduce_csv(path, cols):
    with open(path, "r+", newline="\n") as fr:
        rows = csv.DictReader(fr, delimiter=';')
        with open(f"{path}.reduced.csv", "w+") as fw:
            writer = csv.DictWriter(fw, fieldnames=cols)
            writer.writeheader()
            for row in rows:
                n_dict = dict()
                for key,val in row.items():
                    if key in cols:
                       n_dict[key] = val
                writer.writerow(n_dict)
if __name__ == "__main__":
    reduce_csv(sys.argv[1], sys.argv[2:])
