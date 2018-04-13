export as namespace Elm;

export interface App {}

export namespace Main {
  export function fullscreen(): App;
  export function embed(node: HTMLElement | null): App;
}
