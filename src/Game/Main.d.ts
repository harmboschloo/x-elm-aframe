export as namespace Elm;

export interface App {
  ports: {
    resetBall: {
      subscribe(
        callback: (data: { id: string; props: BallProps }) => void
      ): void;
    };
  };
}

export interface BallProps {
  position: Vec3;
  velocity: Vec3;
  angularVelocity: Vec3;
}

export interface Vec3 {
  x: number;
  y: number;
  z: number;
}

export namespace Game.Main {
  export function fullscreen(): App;

  export function embed(element: HTMLElement): App;
}
