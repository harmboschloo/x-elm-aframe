interface BodyComponent extends AFrame.Component {
  el: BodyEntity;
  data: Data;
}

interface BodyEntity extends AFrame.Entity {
  body?: CANNON.Body;
}

interface Data {
  key: number;
  position: CANNON.Vec3;
  velocity: CANNON.Vec3;
  angularVelocity: CANNON.Vec3;
}

interface Diff {
  key?: number;
  position?: CANNON.Vec3;
  velocity?: CANNON.Vec3;
  angularVelocity?: CANNON.Vec3;
}

AFRAME.registerComponent("dynamic-body-reset", {
  dependencies: ["dynamic-body"],

  schema: {
    key: { type: "int" },
    position: { type: "vec3" },
    velocity: { type: "vec3" },
    angularVelocity: { type: "vec3" }
  },

  init: function() {
    console.log("init", "el", this.el);
  },

  update: function(this: BodyComponent, oldData) {
    const body: CANNON.Body | undefined = this.el.body;

    if (!body) {
      return;
    }

    console.log("el", this.el);
    console.log("body", body);
    console.log("oldData", oldData);
    console.log("data", this.data);
    console.log("diff", AFRAME.utils.diff(oldData, this.data));

    const data: Data = this.data;
    const diff: Diff = AFRAME.utils.diff(oldData, data);

    if (diff.key || diff.position) {
      body.position.copy(this.data.position);
    }

    if (diff.key || diff.velocity) {
      body.velocity.copy(this.data.velocity);
    }

    if (diff.key || diff.angularVelocity) {
      body.angularVelocity.copy(this.data.angularVelocity);
    }
  }
});
