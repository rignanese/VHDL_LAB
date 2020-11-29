# 4bit ripple-carry adder

[Wikipedia ripple-carry adder](https://en.wikipedia.org/wiki/Adder_(electronics)#Ripple-carry_adder).

We can use the structural approach and connect 4 single bit full-adders accordingly with this figure:

![alt text](ripple-carry-adder-4-bit.png )

Our design will handle 4 signal vectors: A, B, S 4bit and C 5bit. The output can be written as C(4)&S, the concatenation of the last element of the Carry vector and the entire Sum vector.

Implementation:
- First of all, create a new folder in which you put the source of your single bit full-adder.
- Create a new VHDL design file and start declaring the entity with 4 ports like in figure
![alt text](Ripple_adder.png )

- The design needs two internal signals one of which for the carry `C(4..0)` and another one for the internal for the sum `S(3..0)` (refer to the first picture)
- Start the architecture and declare this two signals;
- map the ports of 4 single bit full_adder by using `entity work."YOUR FULL ADDER DESIGN" port map`
- follow this template

```
YOUR DSIGN IN1 => A(0),
YOUR DSIGN IN2 => A(0),
YOUR DSIGN CarryIN => C(0),
YOUR DSIGN OUTPUT => S(0),
YOUR DSIGN CarryOUT => C(1)
```
- Assign to the port SUM the value of the concatenation C(4)&S and end the architecture.
- Save and analyze

There are two TBs in the folder ripple_adder. They follows two totally different approaches in the generation of the stimuli. One is forcefully more hardware oriented while the other one uses a much synthetic and clever procedural approach. The 2 codes are commented.


# 4bit carry-lookahead adder 

[Wikipedia carry-lokahead adder](https://en.wikipedia.org/wiki/Carry-lookahead_adder)




<tbody><tr>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML" alttext="{\displaystyle A}">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle scriptlevel="0" displaystyle="true">
        <mi>A</mi>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle A}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/7daff47fa58cdfd29dc333def748ff5fa4c923e3" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.743ex; height:2.176ex;" alt="A"></span></th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML" alttext="{\displaystyle B}">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle scriptlevel="0" displaystyle="true">
        <mi>B</mi>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle B}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/47136aad860d145f75f3eed3022df827cee94d7a" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.338ex; width:1.764ex; height:2.176ex;" alt="B"></span></th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML" alttext="{\displaystyle C_{i}}">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle scriptlevel="0" displaystyle="true">
        <msub>
          <mi>C</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>i</mi>
          </mrow>
        </msub>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle C_{i}}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/cc49dc02c0ec8c86b67e7d10518ac791eda0bf22" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.461ex; height:2.509ex;" alt="C_{i}"></span></th>
<th><span class="mwe-math-element"><span class="mwe-math-mathml-inline mwe-math-mathml-a11y" style="display: none;"><math xmlns="http://www.w3.org/1998/Math/MathML" alttext="{\displaystyle C_{o}}">
  <semantics>
    <mrow class="MJX-TeXAtom-ORD">
      <mstyle scriptlevel="0" displaystyle="true">
        <msub>
          <mi>C</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>o</mi>
          </mrow>
        </msub>
      </mstyle>
    </mrow>
    <annotation encoding="application/x-tex">{\displaystyle C_{o}}</annotation>
  </semantics>
</math></span><img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/a9835cad55ad355d127932c83a89775a5c18f016" class="mwe-math-fallback-image-inline" aria-hidden="true" style="vertical-align: -0.671ex; width:2.691ex; height:2.509ex;" alt="C_{o}"></span></th>
<th>Type of Carry
</th></tr>
<tr>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>None
</td></tr>
<tr>
<td>0</td>
<td>0</td>
<td>1</td>
<td>0</td>
<td>None
</td></tr>
<tr>
<td>0</td>
<td>1</td>
<td>0</td>
<td>0</td>
<td>None
</td></tr>
<tr>
<td>0</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>Propagate
</td></tr>
<tr>
<td>1</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>None
</td></tr>
<tr>
<td>1</td>
<td>0</td>
<td>1</td>
<td>1</td>
<td>Propagate
</td></tr>
<tr>
<td>1</td>
<td>1</td>
<td>0</td>
<td>1</td>
<td>Generate
</td></tr>
<tr>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>Generate/Propagate
</td></tr></tbody>

