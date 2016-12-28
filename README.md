Julia include for PureBasic
=====

Here you can download my translation of the Julia header files into PureBasic includes.
Additionally there is a small example which shows how to utilize Julia from PB.

## Installation
1. Install Julia from [here](http://julialang.org/downloads/). You have to install the 32-bit version if you want to use Julia from a 32-bit application, and the 64-bit version for a 64-bit application.
2. Set environment variables: (This step will be obsolete later)
   * Create `JULIA_HOME`, which should point to the `\bin` directory of your Julia installation.
   * Append `;%JULIA_HOME%` to your `PATH` variable.

## Usage
To use Julia in your application you just have to include the [julia.pbi](/Includes/Julia/julia.pbi) and use the Julia module.
For the basic operation of Julia see the [example](/Example.pb).

## License
Julia itself is distributed under the terms of the MIT license.

As i can't give any warranty on the correctness of the code:
```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Bugs?
This include is in an early state. Some of the structures or functions are just not imported yet. And even the ones which are, may be incorrect. So i'm glad if you could report any include related bug as a new issue here on Github or as a PM on the PureBasic forums.