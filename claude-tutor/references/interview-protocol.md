# Interview protocol: the coherence loop applied to learner interviews

The interview is the part of the skill that fails silently. A bad guide written from a good interview is fixable. A good guide written from a bad interview is rare. This file is the discipline for keeping the interview anchored.

The interview is short by design. Four probes in Phase 2, plus the anchor in Phase 1. The protocol below is the discipline that keeps it from sprawling.

## The coherence loop

A long interview drifts. The learner mentions something interesting, you follow it, the original anchor goes stale, you find yourself two layers deep in a tangent and the original concept has not been talked about in five turns. The result is a transcript, not a guide.

The corrective is a small loop you run continuously, not a checklist you run once:

1. **Anchor.** What concept are we extracting toward? You wrote this down in Phase 1. It does not move during Phase 2. If it needs to move, that is a Phase 1 redo, not a Phase 2 update.

2. **State.** What have you learned so far about the learner? Prior knowledge captured, misconceptions surfaced, transfer goal stated, modality preferences noted. Keep this in working memory throughout the interview.

3. **Drift.** Is the current direction of the conversation moving toward or away from the anchor? Productive divergence (the learner mentions a concrete situation that sharpens the transfer goal) is *toward*. Unproductive divergence (the learner starts telling you about a different topic they also want to learn) is *away*.

4. **Correct.** When drift is away, name it gently and steer back. "That sounds interesting and we can come back to it — let me make sure I have what I need on the original thing first." Do not pretend the tangent did not happen. Park it.

5. **Bound.** The interview ends when you have enough to draft, not when you have everything. The four probes are the floor. Three or four follow-ups across the four probes is the ceiling. If you find yourself on the ninth follow-up, the interview is no longer producing signal — start drafting and refine in Phase 5.

This loop runs in your head every turn. It is not visible to the learner. The learner experiences it as a tutor who stays focused.

## The misconception probe (Probe 2)

This is the load-bearing question of the entire interview. A generic "what do you know about X?" almost never surfaces a misconception, because the learner reports their *self-image* of what they know, not the wrong intuition they are actually carrying around.

The probe has to be designed to expose the *likely incorrect intuition* for this concept. Three heuristics for generating it:

**Heuristic 1 — The plausible-but-wrong question.** Ask the learner to predict, explain, or guess about something where the naive answer is plausible and the correct answer is counterintuitive. The gap between the two is the misconception.

For *the chain rule*, the naive intuition is additive: "if A causes B and B causes C, the rates add up." The chain rule says they multiply. So: "If a small change in x causes a 2x change in u, and a small change in u causes a 3x change in y, how big is the change in y from a small change in x?" If the learner says 5, you have surfaced the misconception. If they say 6, they have it. Either answer is informative.

For *backpropagation*, the naive intuition is that the network "knows" which weights to change. So: "When the network gets an answer wrong, how does it figure out which weights are responsible for the error?" If the learner gestures at something like "it tries them all" or "it knows somehow," you have surfaced the misconception. If they describe credit assignment, they have it.

For *the causes of WWI*, the naive intuition is that Sarajevo *caused* the war. So: "If Sarajevo had not happened, would the war have happened anyway?" If the learner says no, you have a triggering-vs-underlying misconception to address. If they say yes and can articulate why, they already have the distinction.

**Heuristic 2 — The almost-right question.** State a slightly wrong version of the concept and ask the learner if it sounds right. Many learners will agree because the wrong version sounds plausible, and that agreement is the misconception.

For *recursion*: "Recursion is just a fancy loop, right? You could always rewrite a recursive function as a loop without losing anything?" The learner who agrees has missed the call-stack memory model. The learner who disagrees and explains why has it.

**Heuristic 3 — The boundary question.** Ask about an edge case where the naive model breaks. Misconceptions reveal themselves at edges.

For *the chain rule*: "What happens to the chain rule when one of the rates is zero?"

For *probability*: "If the chance of rain on Saturday is 50% and the chance of rain on Sunday is 50%, what is the chance of rain at least once over the weekend?" (The naive answer is 100%; the correct answer is 75% if the events are independent.)

You do not need all three heuristics for every concept. Pick one. The point is that the probe is *designed* to expose a specific wrong model — not a generic "tell me what you know" that lets the learner self-report.

## What to do with the answer

Whatever the learner says, do not correct them in the interview. The temptation is enormous. Resist it. The misconception you just surfaced is the raw material for the "Common confusions" section of the guide — it is more valuable left intact and addressed with care in writing than corrected in passing during a probe.

If the learner *asks* whether their answer was right, say something like: "Hold that thought — I want the guide to address this directly so it sticks. Let me note where you are and we'll come back to it." Then move on.

## When to redo Phase 1

Sometimes the diagnosis reveals that the anchor itself was wrong. The learner said "teach me backprop" but Probe 3 reveals they actually want to understand why their model is not converging — which is a different concept. Or Probe 1 reveals they don't yet know what a derivative is, which means backprop is two concepts away and the right anchor is "the chain rule" or even "what a derivative measures."

When this happens, name it and re-anchor explicitly: "Based on what you said, I think the actual thing you want to understand is X, not Y. Does that match?" Do not silently switch the anchor mid-interview.

This is a feature of the loop, not a failure. Re-anchoring early is much cheaper than producing a guide for the wrong concept.

## When to abort

Abort the interview and tell the learner if any of these happen:
- The concept does not bound — every attempt to narrow it down opens three new directions, and after 6-8 turns the anchor still won't hold. The learner is exploring, not learning. Suggest they come back with a more specific question.
- The learner has effectively no prior context for the concept and the prerequisites are too far back to cover in one guide. Suggest the prerequisite as the anchor instead.
- The misconception probe reveals the learner has the concept already and is looking for validation, not learning. Tell them so directly.

Aborting is cheap. A guide produced from a bad interview is not.
