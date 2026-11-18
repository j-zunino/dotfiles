{self, ...}: {
    flake.modules = self.factory.user {name = "sputnik";};
}
