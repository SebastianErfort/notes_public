---
title: Obsidian DataView
tags:
  - obsidian
  - obsidian/DataView
desc-short: "Dataview is a live index and query engine over your personal knowledge base. You can [**add metadata**](https://blacksmithgu.github.io/obsidian-dataview/annotation/add-metadata/) to your notes and **query** them with the [**Dataview Query Language**](https://blacksmithgu.github.io/obsidian-dataview/queries/structure/) to list, filter, sort or group your data. Dataview keeps your queries always up to date and makes data aggregation a breeze."
type: software
category: ""
url: "https://blacksmithgu.github.io/obsidian-dataview/"
docs: "https://blacksmithgu.github.io/obsidian-dataview/"
source: "https://github.com/blacksmithgu/obsidian-dataview"
developer: ""
visibility: public
---
# Obsidian Dataview

`= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

- [Obsidian Example Vault for Dataview Queries](https://github.com/s-blu/obsidian_dataview_example_vault) | [Demo Website](https://s-blu.github.io/obsidian_dataview_example_vault/)
- [Omit "File" Column in TABLE results @ObsidianForum](https://github.com/blacksmithgu/obsidian-dataview/issues/102)

    ```
    TABLE WITHOUT ID
      col1, col2, ...
    ...
    ```

### Metadata

#### YAML Front Matter

Most metadata should go in the (YAML) front matter of a note. The structure used therein will determine how data is presented in a rendered DataView query.

#### Inline

You can add data inline as [curry:: Thai] with `curry:: Katsu` or `[curry: ]`
or hiding the long key output in Reading mode (cake:: Schwarzwälder Kirsch)

I love `= this.curry` curry and `= this.cake` cake

#### Implicit Fields

Automatically added fields, collected under `file`[^1]

> [!info]- Table of available fields
>
> |Field Name|Data Type|Description|
> |---|---|---|
> |`file.name`|Text|The file name as seen in Obsidians sidebar.|
> |`file.folder`|Text|The path of the folder this file belongs to.|
> |`file.path`|Text|The full file path, including the files name.|
> |`file.ext`|Text|The extension of the file type; generally `md`.|
> |`file.link`|Link|A link to the file.|
> |`file.size`|Number|The size (in bytes) of the file.|
> |`file.ctime`|Date with Time|The date that the file was created.|
> |`file.cday`|Date|The date that the file was created.|
> |`file.mtime`|Date with Time|The date that the file was last modified.|
> |`file.mday`|Date|The date that the file was last modified.|
> |`file.tags`|List|A list of all unique tags in the note. Subtags are broken down by each level, so `#Tag/1/A` will be stored in the list as `[#Tag, #Tag/1, #Tag/1/A]`.|
> |`file.etags`|List|A list of all explicit tags in the note; unlike `file.tags`, does not break subtags down, i.e. `[#Tag/1/A]`|
> |`file.inlinks`|List|A list of all incoming links to this file, meaning all files that contain a link to this file.|
> |`file.outlinks`|List|A list of all outgoing links from this file, meaning all links the file contains.|
> |`file.aliases`|List|A list of all aliases for the note as defined via the [YAML frontmatter](https://help.obsidian.md/How+to/Add+aliases+to+note).|
> |`file.tasks`|List|A list of all tasks (I.e., `\| [ ] some task`) in this file.|
> |`file.lists`|List|A list of all list elements in the file (including tasks); these elements are effectively tasks and can be rendered in task views.|
> |`file.frontmatter`|List|Contains the raw values of all frontmatter in form of `key \| value` text values; mainly useful for checking raw frontmatter values or for dynamically listing frontmatter keys.|
> |`file.day`|Date|Only available if the file has a date inside its file name (of form `yyyy-mm-dd` or `yyyymmdd`), or has a `Date` field/inline field.|
> |`file.starred`|Boolean|if this file has been starred via the Obsidian Core Plugin "Starred Files".|

[^1]: <https://blacksmithgu.github.io/obsidian-dataview/annotation/metadata-pages/>

### Queries

- Types: `LIST`, `TABLE`, `TASK` and `CALENDAR`, see [query types](https://blacksmithgu.github.io/obsidian-dataview/queries/query-types/).
- Fields
    - simple metadata `myfield AS "Field"`
    - use [functions](https://blacksmithgu.github.io/obsidian-dataview/reference/functions/) `("[[" + dateformat(date,"yyyy-MM-dd") + "]]") AS "Date"`
    - tags: use `join` to merge tags array into one string and prevent each showing up on a separate line (in a table): `(join(file.tags)) AS "Tags"`
- Note source: `FROM`
    - tags: `FROM #tag`
    - folders: `FROM "mydir"`
    - incoming link: `FROM [[Note 1]]`
    - outgoing link: `FROM outgoing([[Note1]])`
    - exclude notes: `FROM "dir1" AND -"dir1/subdir"`
    - issues
        - relative paths not yet supported without JS, see [issue](https://github.com/blacksmithgu/obsidian-dataview/issues/517), but this should work

            ```
            WHERE file.folder = this.file.folder
            ```

- Filter metadata: `WHERE`
    - partial match: `WHERE contains(field,"value)"`
    - created within last dat: `WHERE file.ctime >= date(today) - dur(1 day)`
- Sort results: `SORT`
    - by modification date: `Sort file.mtime DESC`
- Group results: `GROUP BY`
- Limit results: `LIMIT value`

[Example vault with queries](https://github.com/s-blu/obsidian_dataview_example_vault/)

#### Inline

See [documentation on inline DQLs](https://blacksmithgu.github.io/obsidian-dataview/queries/dql-js-inline/):

- data from other notes can be accessed with <code>`=[[otherNote]].file.name`</code>


#### Export

HTML from rendered DataView queries can be accessed through Obsidian development tools, e.g. <kbd>ctrl+shift+i</kbd>.


### Functions

[Dataview documentation: Functions](https://blacksmithgu.github.io/obsidian-dataview/reference/functions/)

- [Utility](https://blacksmithgu.github.io/obsidian-dataview/reference/functions/#utility-functions)

    ```js
    // return first value if true, else second value - can be used e.g. as a switch depending on a field value
    choice(bool, "a", "b")
    // format dates: DataView uses [Luxon tokens](https://moment.github.io/luxon/#/formatting?id=table-of-tokens) for time formatting.
    dateformat(field, "yyyy-MM-dd")
    ```

#### Javascript

```markdown
%% find index of element in array %%
`$= dv.current().field.indexOf("value")`
```

## Examples

[Dataview task and project examples](https://forum.obsidian.md/t/dataview-task-and-project-examples/17011)

- [ ] a task

Query for all tasks in this file

````markdown
```dataview
TASK
WHERE file.path = this.file.path
```
````

```dataview
TASK
WHERE file.path = this.file.path
```

### Calendar

HTML link from metadata[^1]

```js
page = dv.page(dv.parse(THE_STRING))

link = `<a href="${page.file.path}" class="internal-link">${page.file.name}</a>`
```
