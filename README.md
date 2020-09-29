# Logs Parser

A simple and effective ruby script which takes a webserver logs file and displays page visits' statistics. Depending on the chosen option, it can calculate the total or unique visits number.

## Setup

```
bundle install
```

## Usage

```
bin/parser.rb webserver.log
```

There is `--data-type` option which can be set to `total_views` or `unique_views`. The default value is `total_views`.

```
bin/parser.rb --data-type=unique_views webserver.log
```

### Example output:
```
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
```

## Performance

The most challenging part of the app, in terms of performance, is reading the input file. To optimize memory usage, it processes the file sequentially, line by line.

The goal was to read each line only once, so it gets the time complexity **O(n)**.

In case of calculating total views, the situation seems easy. The app goes through all the lines of the file once, then adds a newly-met URL to the results and increments the number of occurrences for it.

Calculating unique views is more challenging. In order to receive the time complexity **O(n)**, it was necessary to introduce additional memory. While processing subsequent lines, the app saves unique pairs of URL-IP. It allows skipping the occurrence if the pair is already in the store.

## Architecture Approach

The core of the app is based on the data pipline (`Pipeline` class). It allows adding, removing or changing the processing object in a very easy way. If new complex processing is required, it is possible to add the whole pipeline as a step, which can gets a tree structure.

`Processor` is the main class, which creates a pipeline with the following objects, needed for data processing.

* reader - `File::Reader` - returns the file lines collection.
* parser - `Parser::Logs` - returns parsed collection (url-ip rows).
* counter - `Counter::TotalViews` or `Counter::UniqueViws` depending on data_type, returns calculated view count statistics.
* sorter - `Sorter` - returns statistics, sorted by view count.
* formatter - `Formatter::TotalViews` or `Formatter::UniqueViws` depending on data_type, returns statistics in a readable format.
* writer - `Writer` - writes the statistics to given output (stdout by default).

To read the file sequentially, `File::Reader` returns `File::Handler` which has `each` method, responsible for file opening, calling `&block` with single line and closing the file. The same solution is used in `Parser::Logs`. It decorates collection, using `ParsedLogsDecorator` class. These returned collections are `Enumerable`, so it's easy to work with them.

At the moment, there are two types of statistics. To decrease the complexity of selecting a relevant service, the factory pattern was used. There is `Factory::Counter` and `Factory::Formatter` which return services for total and unique types. It allows adding a new type of service without changing the current implementation.

## Development
To make changes in the file's structure, please take a look on `config/environment.rb`. It's the place where all app files are loaded.

### Linter
```
bundle exec rubocop .
```

### Tests
```
bundle exec rspec .
```