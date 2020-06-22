local explosion_animations = require("prototypes.entity.demo-explosion-animations")
local sounds = require("prototypes.entity.demo-sounds")
local biter_die_effects = require("prototypes.entity.demo-biter-die-effects")

local default_light = function(size)
  return
  {
    intensity = 1,
    size = size,
    color = {r = 1.0, g = 1.0, b = 1.0}
  }
end

local empty_explosion = function(params)
  return
  {
    type = "explosion",
    name = params.name,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = util.empty_sprite(),
    created_effect = params.created_effect
  }
end

data:extend
{
  {
    type = "explosion",
    name = "laser-bubble",
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.laser_bubble(),
    light = {intensity = 1, size = 10, color = {r = 1.0, g = 1.0, b = 1.0}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "railgun-beam",
    flags = {"not-on-map"},
    subgroup = "explosions",
    rotate = true,
    beam = true,
    animations = explosion_animations.railgun(),
    light = {intensity = 1, size = 10, color = {r = 1.0, g = 1.0, b = 1.0}},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "big-artillery-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.bigass_explosion(),
    light = default_light(50),
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "explosion-stone-particle-medium",
            initial_height = 0.5,
            speed_from_center = 0.1,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "explosion-stone-particle-small",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "explosion-stone-particle-tiny",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "artillery-cannon-muzzle-flash",
    flags = {"not-on-map"},
    subgroup = "explosions",
    animations = explosion_animations.artillery_muzzle_flash(),
    rotate = true,
    height = 0,
    correct_rotation = true,
    light = {intensity = 1, size = 10, color = {r=1.0, g=1.0, b=1.0}},
    smoke = "smoke-fast",
    smoke_count = 1,
    smoke_slow_down_factor = 1
  },

  {
    type = "explosion",
    name = "steel-chest-explosion",
    icon = "__base__/graphics/icons/steel-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "storage-explosions",
    order = "a-c-a",
    height = 0,
    animations = util.empty_sprite(), --explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "steel-chest-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "steel-chest-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "active-provider-chest-explosion",
    icon = "__base__/graphics/icons/logistic-chest-active-provider.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-c-a",
    height = 0,
    animations = util.empty_sprite(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "active-provider-chest-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "active-provider-chest-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "passive-provider-chest-explosion",
    icon = "__base__/graphics/icons/logistic-chest-passive-provider.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-d-a",
    height = 0,
    animations = util.empty_sprite (),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "passive-provider-chest-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "passive-provider-chest-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "storage-chest-explosion",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-e-a",
    height = 0,
    animations = util.empty_sprite(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "storage-chest-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "storage-chest-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "buffer-chest-explosion",
    icon = "__base__/graphics/icons/logistic-chest-buffer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-e-a",
    height = 0,
    animations = util.empty_sprite(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "buffer-chest-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "buffer-chest-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "requester-chest-explosion",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-f-a",
    height = 0,
    animations = util.empty_sprite(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "requester-chest-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "requester-chest-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "fast-transport-belt-explosion",
    icon = "__base__/graphics/icons/fast-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-b-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "fast-transport-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "fast-transport-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "transport-belt-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.016,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "fast-transport-belt-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.32,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "express-transport-belt-explosion",
    icon = "__base__/graphics/icons/express-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "express-transport-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "express-transport-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "transport-belt-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.016,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "express-transport-belt-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.32,
            initial_vertical_speed = 0.041,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "fast-underground-belt-explosion",
    icon = "__base__/graphics/icons/fast-underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "fast-underground-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.081,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "fast-underground-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.43,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.048,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "fast-underground-belt-metal-particle-medium-red",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.042,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "express-underground-belt-explosion",
    icon = "__base__/graphics/icons/express-underground-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "express-underground-belt-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.081,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "express-underground-belt-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.43,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.048,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "express-underground-belt-metal-particle-medium-blue",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.042,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "fast-splitter-explosion",
    icon = "__base__/graphics/icons/fast-splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-h-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "fast-splitter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.047,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "fast-splitter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.049,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "fast-splitter-long-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.5977 }, { 0.6953, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "fast-splitter-metal-particle-big",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "fast-splitter-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.029,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "express-splitter-explosion",
    icon = "__base__/graphics/icons/express-splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "belt-explosions",
    order = "b-i-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "express-splitter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.047,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "express-splitter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.049,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "express-splitter-long-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.5977 }, { 0.6953, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "express-splitter-metal-particle-big",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "express-splitter-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.029,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "filter-inserter-explosion",
    icon = "__base__/graphics/icons/filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "inserter-explosions",
    order = "c-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "filter-inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "filter-inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "stack-inserter-explosion",
    icon = "__base__/graphics/icons/stack-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "inserter-explosions",
    order = "c-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "stack-inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "stack-inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "stack-filter-inserter-explosion",
    icon = "__base__/graphics/icons/stack-filter-inserter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "inserter-explosions",
    order = "c-g-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "stack-filter-inserter-metal-particle-medium",
            offset_deviation = { { -0.5, -0.4922 }, { 0.5, 0.4922 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.058,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "stack-filter-inserter-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.4,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "substation-explosion",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "substation-metal-particle-big",
            offset_deviation = { { -0.5, -0.6953 }, { 0.5, 0.6953 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "substation-metal-particle-big",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "substation-long-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "substation-long-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.7891 }, { 0.5977, 0.7891 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.047,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.7891 }, { 0.5977, 0.7891 } },
            initial_height = 0.5,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.011,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "pump-explosion",
    icon = "__base__/graphics/icons/pump.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-pipe-distribution-explosions",
    order = "d-h-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "pump-metal-particle-big",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "pump-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "pump-metal-particle-small",
            offset_deviation = { { -0.6953, -0.6953 }, { 0.6953, 0.6953 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.136,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "pump-glass-particle-small",
            offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.113,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "rail-explosion",
    icon = "__base__/graphics/icons/rail.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-a-a",
    height = 0,
    animations =  util.empty_sprite(),--explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "rail-long-metal-particle-medium",
            offset_deviation = { { -0.6914, -0.6914 }, { 0.6914, 0.6914 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "rail-stone-particle-small",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 28,
            particle_name = "rail-wooden-splinter-particle-medium",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "train-stop-explosion",
    icon = "__base__/graphics/icons/train-stop.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-b-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 27,
            particle_name = "train-stop-metal-particle-medium",
            offset_deviation = { { -0.6875, -0.1914 }, { 0.6875, 0.1914 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "train-stop-long-metal-particle-medium",
            offset_deviation = { { -0.4883, -0.3945 }, { 0.4883, 0.3945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "train-stop-metal-particle-small",
            offset_deviation = { { -0.6914, -0.2969 }, { 0.6914, 0.2969 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.063,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "train-stop-metal-particle-small",
            offset_deviation = { { -0.5859, -0.6875 }, { 0.5859, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.053,
            initial_vertical_speed_deviation = 0.054,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "train-stop-glass-particle-small",
            offset_deviation = { { -0.4883, -0.6875 }, { 0.4883, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.113,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "rail-signal-explosion",
    icon = "__base__/graphics/icons/rail-signal.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "rail-signal-metal-particle-medium",
            offset_deviation = { { -0.2852, -0.2891 }, { 0.2852, 0.2891 } },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "rail-signal-metal-particle-small",
            offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
            initial_height = 0.1,
            initial_height_deviation = 0.31,
            initial_vertical_speed = 0.103,
            initial_vertical_speed_deviation = 0.054,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "rail-signal-glass-particle-small-red",
            offset_deviation = { { -0.2852, -0.293 }, { 0.2852, 0.293 } },
            initial_height = 0.1,
            initial_height_deviation = 0.09,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "rail-signal-glass-particle-small-green",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.09,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "rail-signal-glass-particle-small-yellow",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.07,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "rail-chain-signal-explosion",
    icon = "__base__/graphics/icons/rail-chain-signal.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "rail-chain-signal-metal-particle-medium",
            offset_deviation = { { -0.2852, -0.2891 }, { 0.2852, 0.2891 } },
            initial_height = 0.1,
            initial_height_deviation = 0.3,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "rail-chain-signal-metal-particle-small",
            offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
            initial_height = 0.1,
            initial_height_deviation = 0.31,
            initial_vertical_speed = 0.103,
            initial_vertical_speed_deviation = 0.054,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 36,
            particle_name = "rail-chain-signal-glass-particle-small",
            offset_deviation = { { -0.2852, -0.293 }, { 0.2852, 0.293 } },
            initial_height = 0.1,
            initial_height_deviation = 0.07,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "locomotive-explosion",
    icon = "__base__/graphics/icons/locomotive.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 39,
            particle_name = "locomotive-metal-particle-big",
            offset_deviation = { { -0.5938, -0.7969 }, { 0.5938, 0.7969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "locomotive-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.089
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "locomotive-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "locomotive-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "fluid-wagon-explosion",
    icon = "__base__/graphics/icons/fluid-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "fluid-wagon-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "fluid-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.47,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "fluid-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 19,
            particle_name = "fluid-wagon-long-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "cargo-wagon-explosion",
    icon = "__base__/graphics/icons/cargo-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 36,
            particle_name = "cargo-wagon-metal-particle-big",
            offset_deviation = { { -0.3984, -0.3984 }, { 0.3984, 0.3984 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "cargo-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            particle_name = "cargo-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.114,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "artillery-wagon-explosion",
    icon = "__base__/graphics/icons/artillery-wagon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-h-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.114,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big-yellow",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "artillery-wagon-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "tank-explosion",
    icon = "__base__/graphics/icons/tank.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "transport-explosions",
    order = "e-j-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "tank-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "tank-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.095,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "tank-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.089,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "logistic-robot-explosion",
    icon = "__base__/graphics/icons/logistic-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-a-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "logistic-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 1.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "logistic-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "roboport-explosion",
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "logistic-network-explosions",
    order = "f-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "roboport-metal-particle-big",
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.045,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "roboport-metal-particle-medium",
            offset_deviation = { { -0.5, -0.7969 }, { 0.5, 0.7969 } },
            initial_height = 0.7,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 33,
            particle_name = "roboport-metal-particle-small",
            offset_deviation = { { -0.5977, -0.2969 }, { 0.5977, 0.2969 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.03,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.027,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "arithmetic-combinator-explosion",
    icon = "__base__/graphics/icons/arithmetic-combinator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "circuit-network-explosions",
    order = "g-b-a",
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "arithmetic-combinator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.2969 }, { 0.3945, 0.2969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "arithmetic-combinator-metal-particle-medium",
            offset_deviation = { { -0.5, -0.3906 }, { 0.5, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.039,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "arithmetic-combinator-metal-particle-small",
            offset_deviation = { { -0.5977, -0.8906 }, { 0.5977, 0.8906 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "decider-combinator-explosion",
    icon = "__base__/graphics/icons/decider-combinator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "circuit-network-explosions",
    order = "g-c-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "decider-combinator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.2969 }, { 0.3945, 0.2969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "decider-combinator-metal-particle-medium",
            offset_deviation = { { -0.5, -0.3906 }, { 0.5, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.039,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "decider-combinator-metal-particle-small",
            offset_deviation = { { -0.5977, -0.8906 }, { 0.5977, 0.8906 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "constant-combinator-explosion",
    icon = "__base__/graphics/icons/constant-combinator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "circuit-network-explosions",
    order = "g-d-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "constant-combinator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.2969 }, { 0.3945, 0.2969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.043,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "constant-combinator-metal-particle-medium",
            offset_deviation = { { -0.5, -0.3906 }, { 0.5, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.039,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "constant-combinator-metal-particle-small",
            offset_deviation = { { -0.5977, -0.8906 }, { 0.5977, 0.8906 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.084,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.04,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "power-switch-explosion",
    icon = "__base__/graphics/icons/power-switch.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "circuit-network-explosions",
    order = "g-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "power-switch-metal-particle-medium",
            offset_deviation = { { -0.5938, -0.6953 }, { 0.5938, 0.6953 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "power-switch-metal-particle-small",
            offsets = {{ 0.2422, 0 },{ -0.2422, -0.01563 }},
            offset_deviation = { { -0.5977, -0.3945 }, { 0.5977, 0.3945 } },
            initial_height = 0.1,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.067,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets = {{ -0.2578, -0.007813 },{ 0.3984, 0.007813 }},
            offset_deviation = { { -0.3984, -0.1992 }, { 0.3984, 0.1992 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "steam-turbine-explosion",
    icon = "__base__/graphics/icons/steam-turbine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-g-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "steam-turbine-metal-particle-big",
            offset_deviation = { { -0.5, -0.6953 }, { 0.5, 0.6953 } },
            initial_height = 0.5,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.063,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "steam-turbine-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.5 }, { 0.6953, 0.5 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.09,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 45,
            particle_name = "steam-turbine-metal-particle-small",
            offset_deviation = { { -0.8945, -0.7969 }, { 0.8945, 0.7969 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.089,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "steam-turbine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.037,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "solar-panel-explosion",
    icon = "__base__/graphics/icons/solar-panel.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-c-a",
    height = 0,
    animations =  util.empty_sprite(),--explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 28,
            particle_name = "solar-panel-long-metal-particle-medium",
            offset_deviation = { { -0.6992, -0.5 }, { 0.6992, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 32,
            particle_name = "solar-panel-metal-particle-small",
            offset_deviation = { { -0.8984, -0.7969 }, { 0.8984, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 82,
            particle_name = "solar-panel-glass-particle-small",
            offset_deviation = { { -0.3984, -0.4961 }, { 0.3984, 0.4961 } },
            initial_height = 0.4,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "accumulator-explosion",
    icon = "__base__/graphics/icons/accumulator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-c-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    order = "e-e-e",
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 27,
            particle_name = "accumulator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.4961 }, { 0.3945, 0.4961 } },
            initial_height = 0.4,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 24,
            particle_name = "accumulator-metal-particle-medium",
            offset_deviation = { { -0.7969, -0.5 }, { 0.7969, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "accumulator-metal-particle-small",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.034,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "nuclear-reactor-explosion",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-d-a",
    height = 0,
    animations = explosion_animations.massive_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 39,
            particle_name = "nuclear-reactor-metal-particle-big",
            offset_deviation = { { -0.6914, -0.793 }, { 0.6914, 0.793 } },
            initial_height = 1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.083,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "nuclear-reactor-metal-particle-medium",
            offsets = { { -0.2891, 0.2344 } },
            offset_deviation = { { -0.6914, -0.5 }, { 0.6914, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.096,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 48,
            particle_name = "nuclear-reactor-glass-particle-small",
            offsets = { { -0.6641, 0.6406 } },
            offset_deviation = { { -0.8945, -0.7969 }, { 0.8945, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 41,
            particle_name = "nuclear-reactor-metal-particle-small",
            offset_deviation = { { -0.8945, -0.7969 }, { 0.8945, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.089,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets = { { 0.5234, -0.4609 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.093,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "nuclear-reactor-mechanical-component-particle-medium",
            offsets = { { -0.6641, 0.6406 } },
            offset_deviation = { { -0.8906, -0.7969 }, { 0.8906, 0.7969 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.099,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "programmable-speaker-explosion",
    icon = "__base__/graphics/icons/programmable-speaker.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "circuit-network-explosions",
    order = "g-f-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "programmable-speaker-metal-particle-small",
            offset_deviation = { { -0.3945, -0.1953 }, { 0.3945, 0.1953 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.052,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.361
          },
          {
            type = "create-particle",
            repeat_count = 13,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.3867 }, { 0.5977, 0.3867 } },
            initial_height = 0.8,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.067,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "programmable-speaker-wooden-splinter-particle-medium",
            offset_deviation = { { -0.5977, -0.3906 }, { 0.5977, 0.3906 } },
            initial_height = 0.9,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.048,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "programmable-speaker-wooden-splinter-particle-small",
            offset_deviation = { { -0.5938, -0.6914 }, { 0.5938, 0.6914 } },
            initial_height = 0.8,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.079,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "heat-exchanger-explosion",
    icon = "__base__/graphics/icons/heat-boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 37,
            particle_name = "heat-exchanger-metal-particle-medium",
            offset_deviation = { { -0.8867, -0.3867 }, { 0.8867, 0.3867 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "heat-exchanger-metal-particle-small",
            offset_deviation = { { -0.3906, -0.5977 }, { 0.3906, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "heat-exchanger-metal-particle-big",
            offset_deviation = { { -0.582, -0.5859 }, { 0.582, 0.5859 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "heat-pipe-explosion",
    icon = "__base__/graphics/icons/heat-pipe.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "energy-explosions",
    order = "a-e-a",
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "heat-pipe-metal-particle-small",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.3906, -0.2969 }, { 0.3906, 0.2969 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.028,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 9,
            particle_name = "heat-pipe-metal-particle-medium",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.09375, -0.1875 }, { 0.09375, 0.1875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.046,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.016
          },
        }
      }
    }
  },

  {
    type = "explosion",
    name = "pumpjack-explosion",
    icon = "__base__/graphics/icons/pumpjack.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "extraction-machine-explosions",
    order = "b-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "pumpjack-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.078,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            particle_name = "pumpjack-metal-particle-medium",
            offset_deviation = { { -0.582, -0.8945 }, { 0.582, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            particle_name = "pumpjack-metal-particle-small",
            offset_deviation = { { -0.8945, -0.8906 }, { 0.8945, 0.8906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 29,
            particle_name = "pumpjack-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "assembling-machine-3-explosion",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "production-machine-explosions",
    order = "d-c-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 17,
            particle_name = "assembling-machine-3-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 21,
            particle_name = "assembling-machine-3-metal-particle-medium",
            offset_deviation = { { -0.8789, -0.8945 }, { 0.8789, 0.8945 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "assembling-machine-3-metal-particle-small",
            offset_deviation = { { -0.8945, -0.3906 }, { 0.8945, 0.3906 } },
            initial_height = 0.1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 7,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "assembling-machine-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.069,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "oil-refinery-explosion",
    icon = "__base__/graphics/icons/oil-refinery.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "production-machine-explosions",
    order = "d-d-a",
    height = 0,
    animations = explosion_animations.massive_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big",
            offsets =
            {
              { 0.7734, -0.6484 },
              { -0.7266, 0.5859 }
            },
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.8,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.9805, -0.8867 }, { 0.9805, 0.8867 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.098,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.07,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-small",
            offsets =
            {
              { -1.492, -1.453 },
              { 1.555, -1.469 },
              { 1.477, 1.469 },
              { -0.6172, 0.3281 }
            },
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.075,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 35,
            probability = 1,
            particle_name = "oil-refinery-long-metal-particle-medium",
            offsets =
            {
              { -0.02344, -0.8984 }
            },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.7,
            initial_height_deviation = 0.15,
            initial_vertical_speed = 0.166,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005
          },
          {
            type = "create-particle",
            repeat_count = 9,
            probability = 1,
            particle_name = "oil-refinery-metal-particle-big-tint",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "chemical-plant-explosion",
    icon = "__base__/graphics/icons/chemical-plant.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "production-machine-explosions",
    order = "d-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "chemical-plant-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "chemical-plant-metal-particle-medium",
            offset_deviation = { { -0.9805, -0.8945 }, { 0.9805, 0.8945 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "chemical-plant-metal-particle-small",
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 43,
            particle_name = "chemical-plant-glass-particle-small",
            offsets = { { 0.7109, 0.7578 } },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.096,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "chemical-plant-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.085,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "centrifuge-explosion",
    icon = "__base__/graphics/icons/centrifuge.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "production-machine-explosions",
    order = "d-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "centrifuge-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.087,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 38,
            particle_name = "centrifuge-metal-particle-medium",
            offset_deviation = { { -0.9805, -0.8945 }, { 0.9805, 0.8945 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.095,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.053
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "centrifuge-metal-particle-small",
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.06,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 15,
            particle_name = "centrifuge-long-metal-particle-medium",
            offsets = { { 0.2734, 0.1484 } },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "centrifuge-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.085,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "beacon-explosion",
    icon = "__base__/graphics/icons/beacon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "module-explosions",
    order = "e-a-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 22,
            particle_name = "beacon-metal-particle-big",
            offset_deviation = { { -0.4961, -0.5938 }, { 0.4961, 0.5938 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 27,
            particle_name = "beacon-metal-particle-medium",
            offset_deviation = { { -0.4961, -0.5 }, { 0.4961, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.094,
            initial_vertical_speed_deviation = 0.049,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.018
          },
          {
            type = "create-particle",
            repeat_count = 29,
            particle_name = "beacon-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5938 }, { 0.5938, 0.5938 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "land-mine-explosion",
    icon = "__base__/graphics/icons/land-mine.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "gun-explosions",
    order = "a-a-a", 
    height = 0,
    animations = explosion_animations.small_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
  },

  {
    type = "explosion",
    name = "laser-turret-explosion",
    icon = "__base__/graphics/icons/laser-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "laser-turret-metal-particle-big",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "laser-turret-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.055,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "laser-turret-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "flamethrower-turret-explosion",
    icon = "__base__/graphics/icons/flamethrower-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "flame-thrower-turret-metal-particle-big",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.068,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "flame-thrower-turret-metal-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.055,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "flame-thrower-turret-metal-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.071,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "artillery-turret-explosion",
    icon = "__base__/graphics/icons/artillery-turret.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-f-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion(0.4),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big",
            offset_deviation = { { -0.2969, -0.1953 }, { 0.2969, 0.1953 } },
            initial_height = 0.7,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.11,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "artillery-wagon-metal-particle-small",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.114,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "artillery-wagon-metal-particle-big-yellow",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "artillery-wagon-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "rocket-silo-explosion",
    icon = "__base__/graphics/icons/rocket-silo.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "defensive-structure-explosions",
    order = "b-h-a",
    height = 0,
    animations = explosion_animations.massive_explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 35,
            probability = 1,
            particle_name = "rocket-silo-metal-particle-big",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 0.3,
            initial_height_deviation = 0.14,
            initial_vertical_speed = 0.194,
            initial_vertical_speed_deviation = 0.012,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.025
          },
          {
            type = "create-particle",
            repeat_count = 52,
            probability = 1,
            particle_name = "rocket-silo-metal-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.2969, -0.5 }, { 0.2969, 0.5 } },
            initial_height = 0.8,
            initial_height_deviation = 0.48,
            initial_vertical_speed = 0.135,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.09,
            speed_from_center_deviation = 0
          },
          {
            type = "create-particle",
            repeat_count = 50,
            probability = 1,
            particle_name = "rocket-silo-metal-particle-small",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
            initial_height = 2.5,
            initial_height_deviation = 0.63,
            initial_vertical_speed = 0.109,
            initial_vertical_speed_deviation = 0.042,
            speed_from_center = 0.09,
            speed_from_center_deviation = 0.044
          },
          {
            type = "create-particle",
            repeat_count = 34,
            probability = 1,
            particle_name = "cable-and-electronics-particle-small-medium",
            offsets =
            {
              { -1.461, 3.977 },
              { 1.305, -3.758 },
              { 3.195, 1.492 },
              { -3.367, -1.43 }
            },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.102,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 36,
            probability = 1,
            particle_name = "artillery-wagon-mechanical-component-particle-medium",
            offsets = { { 0, 0 }  },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.131,
            initial_vertical_speed_deviation = 0.041,
            speed_from_center = 0.09,
            speed_from_center_deviation = 0.05
          }
        },
      }
    }
  },

  {
    type = "explosion",
    name = "defender-robot-explosion",
    icon = "__base__/graphics/icons/defender.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "capsule-explosions",
    order = "c-a-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.robot_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "defender-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "defender-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "distractor-robot-explosion",
    icon = "__base__/graphics/icons/distractor.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "capsule-explosions",
    order = "c-b-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.robot_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "distractor-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "distractor-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "destroyer-robot-explosion",
    icon = "__base__/graphics/icons/destroyer.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "capsule-explosions",
    order = "c-c-a",
    height = 1.4,
    animations = explosion_animations.explosion(),
    light = default_light(20),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.robot_explosion(0.5),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "cable-and-electronics-particle-small-medium",
            offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
            initial_height = 1.3,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.091,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "destroyer-robot-metal-particle-medium",
            offset_deviation = { { -0.6953, -0.2969 }, { 0.6953, 0.2969 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.05,
            frame_speed = 1,
            frame_speed_deviation = 0.463
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "destroyer-robot-metal-particle-small",
            offset_deviation = { { -0.5938, -0.5977 }, { 0.5938, 0.5977 } },
            initial_height = 1.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.082,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
        },
      }
    }
  },

  {
    type = "explosion",
    name = "storage-tank-explosion",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-on-map"},
    subgroup = "storage-explosions",
    order = "a-d-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    light = default_light(50),
    sound = sounds.large_explosion(0.8),
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "storage-tank-metal-particle-big",
            offset_deviation = { { -0.3984, -0.6992 }, { 0.3984, 0.6992 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.117,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 27,
            particle_name = "storage-tank-metal-particle-medium",
            offset_deviation = { { -0.5977, -0.2969 }, { 0.5977, 0.2969 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.125,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
        }
      }
    }
  },
  
  empty_explosion
  {
    name = "medium-biter-die",
    created_effect = biter_die_effects.medium_biter
  },

  empty_explosion
  {
    name = "big-biter-die",
    created_effect = biter_die_effects.big_biter
  },

  empty_explosion
  {
    name = "behemoth-biter-die",
    created_effect = biter_die_effects.behemoth_biter
  },
  
  empty_explosion
  {
    name = "medium-worm-die",
    created_effect = biter_die_effects.medium_worm
  },

  empty_explosion
  {
    name = "big-worm-die",
    created_effect = biter_die_effects.big_worm
  },

  empty_explosion
  {
    name = "behemoth-worm-die",
    created_effect = biter_die_effects.behemoth_worm
  },

  empty_explosion
  {
    name = "spitter-spawner-die",
    created_effect = biter_die_effects.spawner_spitter
  },

  empty_explosion
  {
    name = "small-spitter-die",
    created_effect = biter_die_effects.small_spitter
  },

  empty_explosion
  {
    name = "medium-spitter-die",
    created_effect = biter_die_effects.medium_spitter
  },

  empty_explosion
  {
    name = "big-spitter-die",
    created_effect = biter_die_effects.big_biter
  },

  empty_explosion
  {
    name = "behemoth-spitter-die",
    created_effect = biter_die_effects.behemoth_spitter
  },

}


local uranium_cannon_shell_explosion = util.copy(data.raw["explosion"]["big-explosion"])
uranium_cannon_shell_explosion.name = "uranium-cannon-shell-explosion"

--TODO handle HR version when its added.
uranium_cannon_shell_explosion.animations[1].tint = {r = 0.4, g = 1, b = 0.4}

data:extend({uranium_cannon_shell_explosion})

local uranium_cannon_explosion = util.copy(data.raw["explosion"]["explosion"])
uranium_cannon_explosion.name = "uranium-cannon-explosion"

--TODO handle HR version when its added.
for k, v in pairs(uranium_cannon_explosion.animations) do
  v.tint = {r = 0.4, g = 1, b = 0.4}
end

data:extend({uranium_cannon_explosion})
