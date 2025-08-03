'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function (defaults) {
  const app = new EmberApp(defaults, {
    'ember-cli-babel': { enableTypeScriptTransform: true },
    autoImport: {
      watchDependencies: ['ember-showdown-shiki'],
    },
    '@embroider/macros': {
      setConfig: {
        'ember-qunit': {
          theme: 'ember',
        },
      },
    },
  });

  return app.toTree();
};
