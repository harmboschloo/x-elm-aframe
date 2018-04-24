import "./index.html";
import { Game, Vec3 } from "./Main";

const app = Game.Main.fullscreen();

interface BodyElement extends HTMLElement {
  body?: CANNON.Body;
}

app.ports.resetBall.subscribe(({ id, props }) => {
  const ball: BodyElement | undefined = document.querySelector(`#${id}`);
  if (ball && ball.body) {
    setVec3(props.position, ball.body.position);
    setVec3(props.velocity, ball.body.velocity);
    setVec3(props.angularVelocity, ball.body.angularVelocity);
  }
});

const setVec3 = (from: Vec3, to: CANNON.Vec3) => to.set(from.x, from.y, from.z);
