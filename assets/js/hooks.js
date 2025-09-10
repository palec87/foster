import * as vega from 'vega';
import * as vl from 'vega-lite';
import { Handler } from 'vega-tooltip';

let DrawPTnumbers = {
  mounted() {
    this.handleEvent("draw_pt_stats", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#pt_numbers')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};


let DrawEUnumbers = {
  mounted() {
    this.handleEvent("draw_eu_stats", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#eu_numbers')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

// Question 8, several items
let DrawAges = {
  mounted() {
    this.handleEvent("draw_ages", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#ages')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawEducation = {
  mounted() {
    this.handleEvent("draw_education", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#education')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawGender = {
  mounted() {
    this.handleEvent("draw_gender", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#gender')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawRegion = {
  mounted() {
    this.handleEvent("draw_region", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#region')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawWork = {
  mounted() {
    this.handleEvent("draw_work", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#work')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

// Question 1, heard about fostering
let DrawHeardAbout = {
  mounted() {
    this.handleEvent("draw_heard_about", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#heard_about')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

// Question 2, info level
let DrawInfoLevel = {
  mounted() {
    this.handleEvent("draw_info_level", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#info_level')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};


// Foster experience, q3
let DrawExperience = {
  mounted() {
    this.handleEvent("draw_experience", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#experience')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

// Question 4, probability to foster
let DrawProbFor = {
  mounted() {
    this.handleEvent("draw_prob_for", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#probability')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

// Question 5, motives for fostering
let DrawMotivesFor = {
  mounted() {
    this.handleEvent("draw_motives_for", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#motives_for')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

// Question 6, challenges
let DrawChallenges = {
  mounted() {
    this.handleEvent("draw_challenges", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#challenges')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

// Question 7, enablers
let DrawEnablers = {
  mounted() {
    this.handleEvent("draw_enablers", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#enablers')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

export { DrawPTnumbers, DrawEUnumbers, DrawAges,
  DrawGender, DrawEducation, DrawWork,
  DrawHeardAbout,
  DrawRegion, DrawInfoLevel,
  DrawExperience, DrawProbFor, 
  DrawMotivesFor, DrawChallenges,
  DrawEnablers };
