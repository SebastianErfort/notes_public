---
title: Mermaid
type: software
category: visualisation
url: "https://mermaid.js.org"
docs: "https://mermaid.js.org/intro/"
source: "https://github.com/mermaid-js/mermaid"
developer: ""
desc-short: |
  JavaScript based diagramming and charting tool that renders Markdown-inspired text definitions to create and modify diagrams dynamically
tags: ""
visibility: public
---
`= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")` | [mermaid.live](https://mermaid.live/) | [My examples](file://rsc/mermaid)
`= ("> " + this.desc-short)`
Graph types
  - [Flowchart](https://mermaid.js.org/syntax/flowchart.html)
  - [Gantt](https://mermaid.js.org/syntax/gantt.html)
  - [Git](https://mermaid.js.org/syntax/gitgraph.html)
  - [ENR (Entity Relationship)](https://mermaid.js.org/syntax/entityRelationshipDiagram.html#entity-relationship-diagrams)
  - [Mindmap (experimental)](https://mermaid.js.org/syntax/mindmap.html)

## Tools
- [![|20](github.png)mermaid-cli](https://github.com/mermaid-js/mermaid-cli): Command line tool for the Mermaid library
  ```bash
  mmdc -i input.md -o output.svg -t dark -b transparent
  ```


## Config
- [Theme](https://mermaid.js.org/config/theming.html)
  - [Theme variables​](https://mermaid.js.org/config/theming.html#theme-variables)


## Examples
Issues
- connecting a node in a subgraph breaks the subgraph's `direction`

### Flow-Chart
simple graph with *internal links*
```mermaid
graph LR

A[Biology]
B[Chemistry]

A --> B

class A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z internal-link;
```

different node types, subgraphs, connections and a clickable external link
```mermaid
graph LR
a(a) --> b[b]
subgraph sg1[" "]
  direction TB
  c((c)) --> d[[d]]
  sg1a{<a>yay</a>} <--> sg1b{{nay}}
end
a -.-> sg1
sg1 --> e[(e)]

click sg1a "obsidian://open?file=Markdown"
class sg1a external-link;

dead1(("*")) --> id1>This is the text in the box]
```

### Sequence
```mermaid
sequenceDiagram
    Alice->>+John: Hello John, how are you?
    Alice->>+John: John, can you hear me?
    John-->>-Alice: Hi Alice, I can hear you!
    John-->>-Alice: I feel great!
```

### Git
```mermaid
gitGraph
  commit
  commit id: "important fix"
```

## Integration
- [[Pandoc]]: requires (lua) filter [[Pandoc#^959dc1|Pandoc Mermaid filter]]
- [[../documentation/MkDocs]] theme [[../documentation/MkDocs#mkdocs-material|material]] through [[Python-Markdown#Extensions|Python-Markdown extension]]