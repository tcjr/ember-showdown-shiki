import pageTitle from 'ember-page-title/helpers/page-title';
import MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';

<template>
  {{pageTitle "TestApp"}}

  <h2 id="title">Ember Showdown Shiki</h2>

  <hr />
  <MarkdownToHtml @markdown={{@model}} />
  <hr />

  {{outlet}}
</template>
