# Output template

This is the structure for every guide claude-tutor produces. The section order is fixed because it embodies the backward-design sequence: orient to the question, motivate the payoff, build intuition before formalism, address what the learner already gets wrong, then practice, then self-check, then a small handful of next steps.

A worked example follows the template.

## The template

```markdown
# [Concept]

## The essential question

[One sentence — the question whose answer is the understanding. Open the guide with the question itself, not with meta-commentary about the question. The learner should be able to read this sentence alone and feel the pull of the concept.]

## Why this matters

[Two to four sentences. The transfer goal, in concrete terms tied to the learner's actual situation. What will they be able to do after the guide that they cannot do now? Avoid generic appeals to "important in many fields." Be specific to this learner.]

## Building intuition

[The longest section. Two to four paragraphs. A concrete example, scenario, or analogy that gives the learner a mental picture before any formal definition. The intuition has to be load-bearing — it must already contain the structure of the formal idea, just dressed in everyday clothes. Do not introduce new vocabulary here unless you immediately ground it.]

## The core idea

[One paragraph. The enduring understanding stated as a complete sentence, then unpacked. This is the "if you forget everything else, remember this" section. Plain language.]

## The formal picture

[The technical statement, definition, or equations. This section can be skipped if the concept does not have a formal layer (some humanities concepts do not). If the concept has math, the equations live here, with the equation grammar from `writing-style.md`. Always followed by a sentence translating the equation back into the intuition section's language.]

## Common confusions

[Two to four named misconceptions, each in its own short subsection or paragraph. Each one names the wrong intuition, says why it is plausible, and shows what is actually true. Address the misconceptions surfaced in the Phase 2 interview directly. Do not list misconceptions you did not actually probe for — the learner will know the difference.]

## Try it yourself

[Three or four exercises. Each one tagged with one of the Six Facets of Understanding. The set should hit at least three different facets — not three Apply exercises in a row. Exercises should be doable from the guide alone, without external resources, in the time the learner said they had. No "as an exercise to the reader" cop-outs — if the exercise is hard, the learner needs to know how to start.]

**Exercise 1 (Explain).** [...]

**Exercise 2 (Apply).** [...]

**Exercise 3 (Self-knowledge).** [...]

## Self-check

[Three to five questions the learner should be able to answer in their own head after working through the guide. These are not test questions — they are diagnostic. If the learner can't answer one, the section pointer tells them where to look back.]

1. [Question]. *(If unsure, see "Building intuition.")*
2. [Question]. *(If unsure, see "The formal picture.")*
3. [Question]. *(If unsure, see "Common confusions.")*

## Where to go next

[One or two pointers. Not a linkdump. The learner has just done a guide; they do not want twelve next steps. Pick the one or two things that genuinely deepen this concept or set up the natural next concept. Name what is at the destination, not just where it is.]
```

## A worked example

The following is what the template looks like populated for the concept *the chain rule*, written for a learner who is reasonably comfortable with basic derivatives and wants to understand backpropagation but is missing the underlying calculus piece. (The learner profile here is the kind of thing Phase 2 would have surfaced.)

---

# The chain rule

## The essential question

If a small change in one quantity causes a change in a second, and that change causes a change in a third, how big is the original change's effect on the third?

## Why this matters

Backpropagation — the algorithm that lets neural networks learn — is the chain rule applied at scale. If you do not have the chain rule, every explanation of backprop will feel like a magic trick. Once you have it, backprop becomes obvious: each layer is a function, each function multiplies its rate into the cascade, and the gradient at any weight is the product of the rates from the loss back to that weight. The chain rule is the only thing standing between you and reading a backprop derivation as if it were prose.

## Building intuition

Imagine three gears meshed together. The first gear is connected to a crank you turn. The first gear drives the second gear; the second gear drives the third. Suppose the first gear has a 2-to-1 ratio with the second — when you turn the first gear once, the second gear turns twice. And suppose the second gear has a 3-to-1 ratio with the third — when the second gear turns once, the third gear turns three times.

If you turn the crank once, how many times does the third gear turn?

The answer is six, not five. Each gear *multiplies* its ratio into the chain. Two turns of the second gear, each producing three turns of the third, gives six.

This is the chain rule. The naive intuition is that rates *add* — two plus three is five. The correct intuition is that rates *multiply* — two times three is six. The difference matters at every layer of every cascade you will ever encounter.

The reason is structural: the second gear's turn is not independent of the first gear's turn. The second gear only exists in motion because the first gear is moving it. So when you ask "how much does the third gear move when I crank?", you have to ask "how much does the second gear move when I crank?" *and* "how much does the third gear move per unit of the second gear's motion?" — and combine them. Combining them is a multiplication, because the second gear's effect on the third is *proportional to* its own motion.

## The core idea

When a quantity depends on another quantity through an intermediate, the rate of change cascades multiplicatively. If $y$ depends on $u$, and $u$ depends on $x$, then the rate at which $y$ changes with $x$ is the product of two rates: the rate $y$ changes with $u$, and the rate $u$ changes with $x$. The chain has as many factors as it has links.

## The formal picture

If $y = f(u)$ and $u = g(x)$, then

$$\frac{dy}{dx} = \frac{dy}{du} \cdot \frac{du}{dx},$$

which is the gear-ratio insight in symbols. Each factor is a derivative measuring one link in the cascade. If the cascade has more links — $y$ depends on $u$, $u$ depends on $v$, $v$ depends on $x$ — the rule extends in the obvious way: you multiply one factor for each link.

$$\frac{dy}{dx} = \frac{dy}{du} \cdot \frac{du}{dv} \cdot \frac{dv}{dx}.$$

Notice the form — every factor is a derivative, and every derivative is taken with respect to the next link in the chain. The pattern is a rhythm.

## Common confusions

**The additive intuition.** The most common wrong model is that rates along a chain add up. They do not. They multiply. The reason for the confusion is that addition is the more familiar way of combining numbers, and "two then three" *sounds* like "two plus three." But the second rate is acting on the first rate's *output*, not on the original input — which is what makes it multiplicative.

**Treating derivatives as fractions.** The notation $\frac{dy}{dx}$ looks like a fraction, and the chain rule formula looks like the fractions canceling: $\frac{dy}{du} \cdot \frac{du}{dx}$ "cancels" the $du$ to give $\frac{dy}{dx}$. This is a useful mnemonic but it is not what is actually happening — derivatives are limits of ratios, not literal fractions. The cancellation works for the chain rule but breaks for higher derivatives. Trust the rule, not the cancellation.

**Applying it backward.** Some learners write the factors in the wrong order: $\frac{du}{dx} \cdot \frac{dy}{du}$ instead of $\frac{dy}{du} \cdot \frac{du}{dx}$. Multiplication is commutative so the answer is the same — but writing it in the cascade's order ("from the inside out" or "from the outside in," consistently) is what makes it scale to longer chains. Pick a direction and stick with it.

## Try it yourself

**Exercise 1 (Explain).** Without using the formula, explain in your own words why a chain of rates multiplies instead of adds. If a friend who understood basic derivatives but had never seen the chain rule asked you, what would you say? (Hint: the gear example is one way in. Find at least one other.)

**Exercise 2 (Apply).** Differentiate $\sin(x^2)$. Identify the outer function, identify the inner function, and apply the rule. Then check your answer by differentiating $\sin(x^2 + 1)$ and noting that the outer derivative is the same.

**Exercise 3 (Self-knowledge).** When you applied the chain rule in Exercise 2, did you find yourself reaching for the formula or for the gear intuition? Which one came first? If the formula came first, try Exercise 2 again starting from the gears. The goal is for both to feel automatic — but the intuition is what catches your mistakes when the formula is wrong.

## Self-check

1. Why do rates multiply in a chain instead of add? *(If unsure, see "Building intuition.")*
2. Write the chain rule for $y = f(g(h(x)))$ — three nested functions. *(If unsure, see "The formal picture.")*
3. Why is the "fraction cancellation" mnemonic for the chain rule both useful and dangerous? *(If unsure, see "Common confusions.")*

## Where to go next

The chain rule is the entire mathematical content of backpropagation. The next step is to read a one-layer backprop derivation — pick any introduction that shows the gradient of a loss with respect to a single weight — and watch the chain rule appear at every step. Once you can predict each multiplication before the derivation makes it, you have backpropagation.

---

That is the worked example. Notice what the template enforces: the gear intuition lands before any equation appears. The formal section is short because the intuition has done most of the work. The misconceptions are specific and named, each one tied to a real wrong model the learner might be carrying. The exercises hit three distinct facets. The self-check is diagnostic, not test-like. The "where to go next" is one pointer with specific direction, not a linkdump.
