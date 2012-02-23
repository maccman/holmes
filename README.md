# Holmes

Find JavaScript `require()` calls using [detective](https://github.com/substack/node-detective).

Requires Node to be available.

# Usage

require_calls = Holmes.find('/path/to/file.js')
require_calls #=> ['burrito', 'another']