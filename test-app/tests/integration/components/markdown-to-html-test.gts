import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { find, render } from '@ember/test-helpers';
import MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';

module('Integration | Component | markdown-to-html', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders markdown text', async function (assert) {
    const markdown = '*hello world*';
    await render(
      <template><MarkdownToHtml @markdown={{markdown}} /></template>,
    );

    assert.strictEqual(
      find('div')!.innerHTML.trim(),
      '<p><em>hello world</em></p>',
    );
  });

  test('it renders markdown code', async function (assert) {
    const markdown = '```js\nconsole.log("hello world");\n```';
    await render(
      <template><MarkdownToHtml @markdown={{markdown}} /></template>,
    );

    assert.strictEqual(
      find('div')!.innerHTML.trim(),
      '<pre class="shiki github-dark" style="background-color:#1c1e24;color:#e1e4e8" tabindex="0"><code class="language-js line-numbers"><span class="line"><span style="color:#E1E4E8">console.</span><span style="color:#B392F0">log</span><span style="color:#E1E4E8">(</span><span style="color:#9ECBFF">"hello world"</span><span style="color:#E1E4E8">);</span></span></code></pre>',
    );
  });

  test('it renders a code block filename', async function (assert) {
    const markdown =
      '```js {data-filename="foo.js"}\nconsole.log("hello world");\n```';

    await render(
      <template><MarkdownToHtml @markdown={{markdown}} /></template>,
    );

    assert.strictEqual(
      find('div')!.innerHTML.trim(),
      '<div><div class="filename js">foo.js</div><pre class="shiki github-dark" style="background-color:#1c1e24;color:#e1e4e8" tabindex="0"><code class="language-js line-numbers"><span class="line"><span style="color:#E1E4E8">console.</span><span style="color:#B392F0">log</span><span style="color:#E1E4E8">(</span><span style="color:#9ECBFF">"hello world"</span><span style="color:#E1E4E8">);</span></span></code></pre>\n</div>',
    );
  });

  test('it renders a code block diffs', async function (assert) {
    const markdown = '```js {data-diff="+1"}\nconsole.log("hello world");\n```';
    await render(
      <template><MarkdownToHtml @markdown={{markdown}} /></template>,
    );

    assert.strictEqual(
      find('div')!.innerHTML.trim(),
      '<pre class="shiki github-dark has-diff" style="background-color:#1c1e24;color:#e1e4e8" tabindex="0"><code class="language-js line-numbers"><span class="line diff add"><span style="color:#E1E4E8">console.</span><span style="color:#B392F0">log</span><span style="color:#E1E4E8">(</span><span style="color:#9ECBFF">"hello world"</span><span style="color:#E1E4E8">);</span></span></code></pre>',
    );
  });
});
