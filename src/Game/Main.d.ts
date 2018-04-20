export as namespace Elm;

export namespace Game.Main {
  export interface App {}
  export function fullscreen(): App;
  export function embed(element: HTMLElement): App;
}
