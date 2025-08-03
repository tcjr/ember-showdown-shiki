import { defineConfig } from 'vite';
import { extensions, classicEmberSupport, ember } from '@embroider/vite';
import { babel } from '@rollup/plugin-babel';
import ViteYaml from '@modyfi/vite-plugin-yaml';

export default defineConfig({
  plugins: [
    classicEmberSupport(),
    ember(),
    ViteYaml(),
    babel({
      babelHelpers: 'runtime',
      extensions,
    }),
  ],
});
