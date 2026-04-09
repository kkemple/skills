# Understanding by Design: working reference

Understanding by Design (UbD), introduced by Grant Wiggins and Jay McTighe, is a curriculum design framework built on **backward design**. Most teaching plans begin with activities and content. Backward design begins with the destination — what the learner should understand and be able to do — and works backward from there.

This reference is the working subset of UbD that claude-tutor uses. It is not a complete treatment. It is what you need to plan one guide.

## The three stages

UbD organizes design into three stages, applied in order.

**Stage 1 — Identify desired results.** What should the learner understand at the end? Three layers of importance, distinguished:

- *Familiar with*: things the learner should have heard of and could recognize
- *Know and do*: facts and skills the learner should be able to recall and execute
- *Enduring understanding*: the central idea the learner should still have ten years from now, after the facts have decayed

The enduring understanding is the target. The other two layers are scaffolding that supports it.

**Stage 2 — Determine evidence of understanding.** Before designing instruction, design how you will know whether understanding has been reached. Assessments are designed *before* lessons, not after. In claude-tutor, this is the "Try it yourself" and "Self-check" sections of the output template — they are the assessments, and they are the second thing planned, not the last.

**Stage 3 — Plan learning experiences.** Only now do you design the actual instruction — the worked examples, the explanations, the analogies. The instruction exists to get the learner from where they are to where Stage 1 said they should be, with Stage 2 confirming when they are there.

claude-tutor compresses all three stages into a single guide. Phase 3 of the workflow is Stage 1. The output template's "Try it yourself" and "Self-check" sections are Stage 2. The "Building intuition," "The core idea," and "The formal picture" sections are Stage 3.

## Enduring understanding

The thing that survives forgetting. The "big idea."

A good enduring understanding is:
- A complete sentence, not a topic
- Transferable beyond the immediate context
- Counter to a common naive intuition (this is what makes it worth teaching)
- Stateable in plain language, even if the underlying technicalities are hard

**Examples.**

For *backpropagation*: "A neural network learns by attributing its error backward through its layers, weighting each parameter's update by how much that parameter contributed to the error."

For *the chain rule*: "When a quantity depends on another quantity through an intermediate, the rate of change is the product of the rates at each step — change cascades multiplicatively."

For *the causes of WWI*: "Triggering events are not the same as underlying causes — Sarajevo was the spark, but the powder had been dry for decades."

Notice each one is a sentence. A topic ("how networks learn," "derivatives of compositions," "the causes of WWI") is not yet an enduring understanding.

## Essential question

The question whose answer *is* the understanding.

A good essential question is:
- Genuinely open — not a recall question with a known answer
- Provocative — it should make the learner want to find out
- Returnable — it can be asked again at higher levels of sophistication later

**Examples.**

For *backpropagation*: "How does a network with no idea what it's doing know which knob to turn?"

For *the chain rule*: "If A causes B and B causes C, how fast does A cause C?"

For *the causes of WWI*: "Was the war inevitable, or did one assassination start it?"

The essential question goes at the top of the guide. It frames everything that follows.

## Transfer goal

What the learner can *do* differently after the guide that they could not do before. Concrete, observable, outside the immediate context of the guide itself.

A good transfer goal is:
- An action verb, not a state of knowing
- Tied to a real situation the learner cares about
- Distinguishable from "I read the guide and it made sense"

**Examples.**

For *backpropagation*: "Read a backprop implementation in PyTorch and predict what the gradient at a given parameter will look like before running it."

For *the chain rule*: "Differentiate `sin(x²)` without looking it up, and explain to someone else why the answer is what it is."

For *the causes of WWI*: "Take a current geopolitical flashpoint and identify which factors are triggers vs. underlying tensions."

Transfer goals come from the learner's Probe 3 answer. If you find yourself inventing one, you didn't ask hard enough.

## The Six Facets of Understanding

UbD argues that understanding is not one thing — it is six. A learner who has truly understood a concept can demonstrate it through any of these facets, and a guide that only exercises one facet teaches a thin understanding.

| Facet | What it means | Example exercise |
|-------|---------------|-----------------|
| **Explain** | Justify, give reasons, demonstrate the *why* | "Explain to a friend who has never seen calculus why the chain rule has to look the way it does." |
| **Interpret** | Find meaning, translate, make sense of | "Read this gradient update and say what the network 'believes' about its mistake." |
| **Apply** | Use in a new situation | "Implement a one-layer backprop pass for a network you have not seen before." |
| **Perspective** | See from multiple viewpoints, recognize the assumptions | "How would a Marxist historian frame the causes of WWI differently from a great-power-politics historian?" |
| **Empathize** | Inhabit another's experience or framing | "What does the loss landscape *look like* from the optimizer's point of view? Where does it want to go?" |
| **Self-knowledge** | Recognize your own assumptions and limits | "Where are you still guessing? What part of this would you fail to explain under pressure?" |

The "Try it yourself" section of the output template should hit at least three of these facets. Which three depends on the concept and the learner.

For a math concept, *Explain*, *Apply*, and *Self-knowledge* are usually right.

For a historical concept, *Interpret*, *Perspective*, and *Empathize* are usually right.

For a concept about a system or a process (a network, a market, an organism), *Interpret*, *Apply*, and *Empathize* often surface things the other facets miss — *Empathize* especially, because inhabiting a system's "point of view" is a powerful way to grasp how it behaves.

The mix is a judgment call. The discipline is that you check facet coverage explicitly during Phase 3, instead of producing four exercises that all turn out to be Apply.

## Uncovering, not covering

A core UbD slogan: the goal is to *uncover* a concept, not to *cover* it. Coverage is breadth without depth — the learner sees the topic and could pass a recognition test on it, but does not understand it. Uncovering means going under the surface, exposing the structure, the contradictions, the edges, the things that are *almost* true but actually wrong.

For claude-tutor specifically, this is why the "Common confusions" section is mandatory. A guide that explains a concept correctly but does not explicitly walk through what is *almost* true and why it's wrong has covered the topic without uncovering it. The misconceptions are the load-bearing surface — they are where the learner's intuition is currently parked, and the guide has to move them off it.
