# Table Block Constraints

## Hard-reject constraints

### [Block:Table]C01: Type value
The `type` field must be `"table"`.

### [Block:Table]C02: Rows required
The `rows` field is required and must be an array of table rows.

### [Block:Table]C03: Rows max items
The `rows` array must not contain more than 100 rows.

### [Block:Table]C04: Row max cells
Each row in `rows` must not contain more than 20 table cells.

### [Block:Table]C05: Table cell type
Each table cell must have a `type` of `"raw_text"` or `"rich_text"`.

### [Block:Table]C06: Column settings max items
The `column_settings` array, if present, must not contain more than 20 items.

### [Block:Table]C07: Column settings align values
The `align` field in a column setting, if present, must be one of `"left"`, `"center"`, or `"right"`.

### [Block:Table]C08: Column settings is_wrapped type
The `is_wrapped` field in a column setting, if present, must be a boolean.

### [Block:Table]C09: One table per message
Only one table block is allowed per message. Including more than one table block results in the error `invalid_attachments`.

## Scored constraints

### [Block:Table]C10: Column headers are descriptive
Column headers should clearly label the data below them. Generic headers like "Column 1" or "Value" force readers to scan the data to understand the table's purpose.
**Confidence signals:** Headers are generic placeholders = high. Headers are abbreviated but recognizable in context = low.

### [Block:Table]C11: Data density appropriate
Tables should have enough rows to justify the overhead of a tabular layout. A table with only one data row is often better expressed as key-value pairs in section blocks.
**Confidence signals:** Single data row in a table = high. Two rows where a simpler layout might work = low.
