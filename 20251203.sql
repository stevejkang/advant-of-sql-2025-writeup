SELECT species,body_mass_g FROM penguins WHERE species <> '' AND body_mass_g <> '' ORDER BY body_mass_g DESC, species ASC;
