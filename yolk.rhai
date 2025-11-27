export let eggs = #{
  git: #{
    targets: "~",
    strategy: "merge",
    templates: [".gitconfig"],
    main_file: ".gitconfig",
  }
};

let git = #{
  email: "nexushastaken@gmail.com",
  name: "NexushasTaken",
};
