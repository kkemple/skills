# Writing style for claude-tutor study guides

The voice of the produced guide is **warm but austere**. It addresses the learner directly. It does not pad. It does not perform. It does not flatter.

Most of these rules come from a writing-quality corpus calibrated for math and physics papers. The corpus has been triaged for pedagogy: rules that are universal good writing are kept; rules that are math-paper-specific (theorem blocks, sigma significance, frontmatter pitch lines) are dropped. What remains is the discipline that makes a guide read like one voice instead of a scrap heap.

## The non-negotiables

**Intuition before formalism.** Always. Every concept is introduced as a concrete example, scenario, or analogy *before* its definition or equations. The learner has to be able to see the thing in their head before you put a symbol on it. This is the single rule that does the most pedagogical work — almost every bad explanation in the world fails it.

**One idea per paragraph.** A paragraph is a container for one complete thought. If the paragraph is doing two things, it is two paragraphs. If the paragraph is doing half a thing, it joins the next one.

**Prose over lists.** Lists are for things that are genuinely enumerable: exhaustive partitions, ordered steps, parallel items. Lists are not for emphasis, not for "breaking up the text," not for hiding incomplete thoughts. The "Try it yourself" exercises are a list because they are genuinely enumerable. Most other sections are prose.

**No padding.** Every sentence advances something — the argument, the intuition, the orientation, or the bridge. If a sentence could be deleted without losing anything, delete it. This includes throat-clearing openings ("In this section we will discuss…"), summary closings ("So as we have seen…"), and meta-commentary about the guide itself ("This is a difficult concept but…").

**Address the learner directly.** Use *you*. The guide is for one specific person and the second person is the right register. Not "one might consider" — *you might consider*. Not "the reader will notice" — *you will notice*. This is a deliberate departure from the math-paper register, where second-person is rare. The pedagogy register is different.

**Do not use first person.** No *I*, no *we*. The guide is not a record of the skill's process. It is the artifact. The skill is invisible. Two narrow exceptions: in the "Common confusions" section you may say *you might think X — but it turns out…*, and in scope/limitations passages where the guide is being honest about what it does not cover.

## Confidence and hedging

**State definitive things definitively.** If the chain rule says rates multiply, say "rates multiply" — not "rates generally multiply" or "rates can be thought of as multiplying." Hedging on definite claims is noise and the learner reads it as uncertainty about the concept itself.

**Hedge empirical and contextual claims with measure.** If the claim is "in most implementations" or "for typical use cases," say so. If the claim depends on the framework, name the framework. The discipline is: hedge where hedging is true, do not hedge where it is not.

**No qualifier inflation.** *Very*, *quite*, *really*, *extremely*, *particularly*, *somewhat*, *arguably*, *perhaps* — most of these can be deleted with no loss. The remaining ones earn their place by carrying real meaning.

## Structure within a section

**Open with the move, not the meta.** A section opens with the actual content — the example, the claim, the question — not with an announcement of what the section is about. The reader can see the heading. They do not need a sentence telling them the heading is about to be discussed.

Bad: "In this section we'll look at how the chain rule applies to compositions of three or more functions."

Good: "Composing three functions is where the chain rule starts to look like a rhythm. Take `sin(cos(x²))` …"

**Build cumulatively.** Each paragraph builds on the prior one. Do not loop back to repeat what was just said. Do not summarize at the bottom of every section. Trust the learner to remember the previous paragraph.

**Recap in a section that recaps.** The "Self-check" section *is* a recap, structurally. So is the closing of "Common confusions." Other sections do not need their own recap — the global structure handles it.

**Acknowledge objections preemptively.** When a learner is about to think "but what about X" — answer them in the next sentence, before they have to ask. This is anticipation, not defensiveness.

## Equation grammar (when math appears)

**Display math is grammar.** A display equation is a noun phrase in a sentence. The sentence around it has the comma, period, or semicolon it would have if the equation were a regular noun. Equations do not float free.

Bad:
> The chain rule says
> 
> $$\frac{dy}{dx} = \frac{dy}{du} \cdot \frac{du}{dx}$$
> 
> This means…

Good:
> The chain rule says that
>
> $$\frac{dy}{dx} = \frac{dy}{du} \cdot \frac{du}{dx},$$
>
> which means…

**Equations always followed by interpretation.** Never end a paragraph on an equation. The equation states the formal fact; the next sentence states what it means. The pair is the unit, not the equation alone.

**Inline math with `$`, display math with `$$`.** Inline for short symbols and short expressions; display for anything longer than three or four symbols, anything that needs to be parsed, or anything that is being pointed at as "this thing."

## Lists (when used)

**Numbered lists for ordered things.** Steps in a procedure, items in a sequence with a defined order. The order has to mean something.

**Bulleted lists for parallel things.** Exhaustive cases, parallel attributes, items in a set without a meaningful order.

**Never use lists for narrative development.** A four-bullet list of half-thoughts is four sentences trying to escape being prose. Reassemble them.

## What to drop from the math-paper voice

Some patterns from the source corpus do not belong in a learner-facing guide:

- **Theorem / Lemma / Proposition blocks.** A study guide is not a paper. State the result in prose with appropriate emphasis.
- **QED markers (◼).** Same reason.
- **Footnotes for citations.** A study guide is not a bibliography. If a source matters enough to cite, name it inline.
- **"Structural realist" register.** Phrases like "the obstruction is geometric rather than parametric" are precise and useful in a paper and almost nothing in a guide.
- **Sigma levels and quantitative confidence framing.** Save for the appendix of a real paper.
- **Pitch-line frontmatter abstracts.** The guide's first section is "The essential question," not a self-summary.

## What to keep from the math-paper voice

The keep-list is short and load-bearing:

- Open with content, not meta
- One voice from start to finish
- No looping or repeating
- Anticipate objections within the argument
- Equation grammar with proper punctuation
- Em-dash for inserted definitions and clarifications — like this — used sparingly
- Oxford comma in lists of three or more
- Active voice for the argument; passive only for natural-phenomenon descriptions

## A single test for the whole guide

When the draft is done, read it aloud in your head as if you are the learner who said "teach me this." If at any point you would say "yes, get on with it" or "I already know that part" or "wait, that came out of nowhere" — that is a place that needs editing. The guide should feel like the tutor knows what you need next, in the order you need it, without wasted breath.
