-- Trigger function to award medals when a user_stat is inserted or updated
CREATE OR REPLACE FUNCTION award_medals_on_user_stats_change()
RETURNS TRIGGER AS $$
BEGIN
  -- Insert medals whose condition is stat-based and threshold is met
  INSERT INTO user_medals (id, user_id, medal_id, achieved_at)
  SELECT gen_random_uuid(), NEW.user_id, mc.medal_id, NOW()
  FROM medal_conditions mc
  WHERE mc.source_type = 'stat' AND mc.stat_id = NEW.stat_id AND NEW.current_value >= mc.threshold
    AND NOT EXISTS (
      SELECT 1 FROM user_medals um WHERE um.user_id = NEW.user_id AND um.medal_id = mc.medal_id
    );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Attach trigger to user_stats
DROP TRIGGER IF EXISTS trg_award_medals_on_user_stats_change ON user_stats;
CREATE TRIGGER trg_award_medals_on_user_stats_change
AFTER INSERT OR UPDATE ON user_stats
FOR EACH ROW EXECUTE FUNCTION award_medals_on_user_stats_change();

-- Trigger function to award medals when streaks are updated
CREATE OR REPLACE FUNCTION award_medals_on_streaks_change()
RETURNS TRIGGER AS $$
BEGIN
  -- For streak-based conditions, we assume source_key = 'current_days'
  INSERT INTO user_medals (id, user_id, medal_id, achieved_at)
  SELECT gen_random_uuid(), NEW.user_id, mc.medal_id, NOW()
  FROM medal_conditions mc
  WHERE mc.source_type = 'streak' AND mc.source_key = 'current_days' AND NEW.current_days >= mc.threshold
    AND NOT EXISTS (
      SELECT 1 FROM user_medals um WHERE um.user_id = NEW.user_id AND um.medal_id = mc.medal_id
    );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Attach trigger to streaks
DROP TRIGGER IF EXISTS trg_award_medals_on_streaks_change ON streaks;
CREATE TRIGGER trg_award_medals_on_streaks_change
AFTER INSERT OR UPDATE ON streaks
FOR EACH ROW EXECUTE FUNCTION award_medals_on_streaks_change();
