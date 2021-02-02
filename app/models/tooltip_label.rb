class TooltipLabel < ActiveRecord::Base
  belongs_to :item

  NUMBER = /(\b\d+(?:\+)?\b(|(?:\s)))/

  ARMOR = /(Armor)\b/
  DURABILITY = /(Durability)\b/
  DEFENSE = /(Equip: Increased Defense)\b/
  DODGE = /(Equip: Increases your chance to dodge an attack by)\b/
  ATTACK_POWER = /Attack Power\b/

  AGILITY = /(\+)(.*)(Agility)\b/
  INTELLECT = /(\+)(.*)(Intellect)\b/
  SPIRIT = /(\+)(.*)(Spirit)\b/
  STRENGTH = /(\+)(.*)(Strength)\b/
  STAMINA = /(\+)(.*)(Stamina)\b/

  MP5 = /(Equip: Restores)\b/
  HEAL_POWER = /(Equip: Increases healing done by spells and effects by up to)\b/
  SPELL_POWER = /(Equip: Increases damage and healing done by magical spells and effects by up to)\b/
  SPELL_CRIT = /(Equip: Improves your chance to get a critical strike with spells by)\b/
  SPELL_HIT = /(Equip: Improves your chance to hit with spells by)\b/
  HIT = /(Equip: Improves your chance to hit by)\b/

  def kind_of_stat
    case label
    when ARMOR
      :armor
    when DURABILITY
      :durability
    when DEFENSE
      :defense
    when DODGE
      :dodge
    when ATTACK_POWER
      :attack_power
    when AGILITY
      :agility
    when INTELLECT
      :intellect
    when SPIRIT
      :spirit
    when STRENGTH
      :strength
    when STAMINA
      :stamina
    when MP5
      :mp5
    when HEAL_POWER
      :healPower
    when SPELL_POWER
      :spellPower
    when SPELL_CRIT
      :spellCrit
    when SPELL_HIT
      :spellHit
    when HIT
      :hit
    else
      :unknown
    end
  end

  def stat_value
    if NUMBER.match?(label)
      label.match(NUMBER)[1]&.to_i
    else
      label
    end
  end

  def stat_hash
    { kind_of_stat => stat_value } if kind_of_stat != :unknown
  end
end
