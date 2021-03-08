## Slice Take Home Coding Challenge

### Dependencies

You will need:

* a modern version of Ruby (I've written this in v2.7.1)

### Setup

1. Clone the repository
```bash
git clone https://github.com/jamvar/slice_coding_challenge.git
```

2. Install Dependencies:

Install bundler if not present
```bash
cd slice_coding_challenge
gem install bundler
```

Install Gems
```bash
bundle install
```

### Tests
Run the following command:
```bash
rspec
```

### Instructions to use

You can run the `./pizzabot input_string` to get the delivery direction instructions

Example for input `"5x5 (1, 3) (4, 4)"`
```bash
./pizzabot "5x5 (1, 3) (4, 4)"
```
Expected Output: `ENNNDEEEND`

For `./pizzabot "5x5 (0, 0) (1, 3) (4, 4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"`,
Output: `DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD`

### Edgecases excluded

- The Challenge does not mention if the starting point (0,0) should be excluded from the list of locations.
- Also, does not mention if the duplicates in locations should be ignored.

### Troubleshooting

If you run into executable issues. Make the `pizzabot` executable by running
```bash
chmod +x pizzabot
```
