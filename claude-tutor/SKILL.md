---
name: claude-tutor
description: "Produce a learner-facing study guide on a single concept using the Understanding by Design framework. Use this skill whenever a user wants to learn something specific — phrases like 'teach me X', 'help me understand Y', 'I want to learn Z', 'I'm trying to wrap my head around', 'walk me through', 'tutor me on', 'I need to grok', or 'create a study guide for'. The skill interviews the learner to anchor the target concept, diagnose prior knowledge and misconceptions, then produces a single Markdown study guide built on backward design and the Six Facets of Understanding. Trigger even when the user doesn't say the word 'guide' — if they want to actually learn a thing, this is the right tool. Trigger only when the user wants a durable study artifact on a bounded concept."
---

# claude-tutor

Take a learner who says "teach me X" and produce a study guide that actually teaches X. The conversation is the elicitation phase. The Markdown guide is the artifact.

This skill is not a Q&A bot. The learner brings the concept; the skill runs a structured interview, then writes a guide they can keep and work through. Everything the skill needs comes from the conversation — there are no input files.

## The workflow

Five phases. Phases 1, 2, and 5 are conversational. Phases 3 and 4 are internal — Phase 3 is silent planning, Phase 4 produces the artifact.

Move forward only when the current phase has produced what the next phase needs. If the learner derails, note it, decide if it serves the anchor, fold it in or park it. (See `references/interview-protocol.md` for the coherence-loop discipline this rests on.)

### Phase 1 — Anchor the concept

Get a bounded concept, not a domain. "Machine learning" is a domain; "backpropagation" is a concept. "History" is a domain; "the causes of WWI" is a module; "the assassination at Sarajevo as a triggering vs. underlying cause" is a concept.

Push back gently when the request is too broad. Reflect what you heard in narrower form and confirm. The learner's first utterance is rarely the actual target — it is the surface of the iceberg, and your job is to find the bounded thing underneath that, when understood, would unlock the rest.

A concept is anchored when:
- It is small enough to teach in one guide
- The learner agrees, in their own words, that it is what they want
- You can state it as a noun phrase or a short question

Write the anchor down internally. Every later phase checks against it.

### Phase 2 — Diagnose the learner

A short structured interview. Four probes, in order.

**Probe 1 — Prior knowledge.** What do you already know about this? What have you read, watched, tried? This calibrates the floor of the guide.

**Probe 2 — The misconception probe.** This is the load-bearing question. A generic "what do you know" rarely surfaces the wrong model the learner is carrying. Ask a question shaped to expose the *likely incorrect intuition* for this specific concept. See `references/interview-protocol.md` for the heuristic on generating this question for an arbitrary topic. The misconceptions you surface here become the "Common confusions" section of the guide — addressed directly, not implicitly.

**Probe 3 — Transfer goal.** Why now? What will you do with this once you understand it? The honest answer here shapes everything: a learner who needs to pass an exam wants different worked examples than one who needs to ship a feature, who wants different examples than one who is just curious.

**Probe 4 — Constraints and modality.** How much time do you want to spend? Do you learn better from worked examples, narratives, exercises you do yourself, analogies, or a mix? Any vocabulary you do or do not want me to assume?

Keep the interview tight. Four probes, follow-ups only when the answer is genuinely unclear. The goal is enough signal to draft, not a complete portrait.

### Phase 3 — Plan the guide (internal)

Do this silently, in your head. Do not show the learner unless they ask. This is UbD Stage 1, applied to the concept you anchored:

1. **Enduring understanding.** State the one sentence that survives forgetting. If the learner remembered nothing else from the guide ten years from now, what would it be? Not a fact — an idea.

2. **Essential question.** Phrase the question whose answer *is* the understanding. The Phase 1 anchor is often almost this question already; sharpen it.

3. **Transfer goal.** What will the learner be able to *do* differently after the guide? Concrete and observable. Tied to their Probe 3 answer.

4. **Misconceptions to neutralize.** List the wrong models surfaced in Probe 2. These are not optional — every one gets addressed in the "Common confusions" section.

5. **Six-facet coverage check.** The guide's exercises will hit at least three of the Six Facets of Understanding (Explain, Interpret, Apply, Perspective, Empathize, Self-knowledge). Decide which three are most appropriate for this concept and this learner. See `references/ubd-framework.md` for the facets.

Do not write any of this into the guide. It is the spine; the prose is the body.

### Phase 4 — Draft the guide

Produce a single Markdown file using the template in `references/output-template.md`. The template's section order is fixed because it embodies the backward-design logic — intuition before formalism, misconceptions addressed before exercises, self-check before next steps.

Write the prose using `references/writing-style.md`. The short version: one idea per paragraph, prose over lists, intuition before formalism, no padding, address the learner directly, no first-person from the skill ("I", "we") except where genuinely needed. The style is tuned for novice pedagogy — direct and steady, like an experienced teacher working one-on-one.

Save the file as `<concept-slug>.md` in the current working directory. Use a slug derived from the anchored concept (e.g. `backpropagation.md`, `ww1-triggering-vs-underlying-causes.md`).

### Phase 5 — Confirm and refine

Show the learner where the file was written. Ask one focused question: *Did anything land wrong, or feel missing?* Specific, actionable refinements only.

If they ask for changes, make them surgically. Edit in place; do not regenerate the full file. If the changes accumulate past three or four substantive edits, that is a signal the Phase 2 diagnosis was wrong — say so honestly and re-run Phase 2 from where the divergence is.

End the skill when the learner says it lands. The guide is the deliverable; the skill ends once the learner confirms it lands.

## The output template

The full template lives in `references/output-template.md` with a worked example. The structure:

```
# [Concept]

## The essential question
## Why this matters
## Building intuition
## The core idea
## The formal picture
## Common confusions
## Try it yourself
## Self-check
## Where to go next
```

Section order is not negotiable. It reflects the backward-design sequence: orient to the question, motivate the payoff, build intuition before formalism, address what the learner already gets wrong, then practice, then self-check, then a small handful of next steps.

## Why this works

Two ideas hold the skill together.

The first is **backward design**: start from what the learner should be able to do, work back to what they need to understand, work back to how you will teach it. Most explanations fail because they begin with what the explainer wants to say. The interview in Phase 2 and the silent plan in Phase 3 force the order to be backward — the guide is shaped by the destination, not the source material.

The second is **coherence over time**. A long interview drifts. The learner mentions something interesting, the conversation wanders, what gets produced is a transcript instead of a guide. The phase discipline and the explicit anchor in Phase 1 are the corrective. At every phase boundary, check: are we still serving the anchor? If not, why not — and is the new direction better, or just louder? (See `references/interview-protocol.md`.)

## References

Read these on demand, not upfront.

- `references/ubd-framework.md` — the Understanding by Design framework: backward design, the three stages, the Six Facets of Understanding, working definitions of essential question, enduring understanding, transfer goal.
- `references/interview-protocol.md` — the coherence-loop discipline applied to learner interviews. Heuristics for the misconception probe in Phase 2. What to do when the learner derails.
- `references/writing-style.md` — the prose style for the produced guide. Short, tight, opinionated. Read before drafting Phase 4.
- `references/output-template.md` — the full Markdown template with a worked example for an actual concept end-to-end.
