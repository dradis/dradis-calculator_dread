@DREADCalculator =
  calculate: ->
    damage     = parseInt($("input[name='damage']:checked").val())
    affected   = parseInt($("input[name='affected']:checked").val())
    impact     = (damage + affected) / 2

    repro      = parseInt($("input[name='repro']:checked").val())
    exploit    = parseInt($("input[name='exploit']:checked").val())
    disc       = parseInt($("input[name='disc']:checked").val())
    threat     = $("input[name='disc']:checked").data('agent')
    likelihood = (repro + exploit + disc) / 3

    dread        = (impact + likelihood) / 2
    dread_vector = "DREAD:1.0/D:#{damage}/A:#{affected}/R:#{repro}/E:#{exploit}/DI:#{disc}"

    impact_fixed     = DREADCalculator._fix(impact)
    likelihood_fixed = DREADCalculator._fix(likelihood)
    dread_fixed      = DREADCalculator._fix(dread)

    $('#impact-score').text(impact_fixed)
    $('#likelihood-score').text(likelihood_fixed)
    $('#dread-score').text(dread_fixed)

    issue_dread = "#[DREAD.Vector]#\n"
    issue_dread += "#{dread_vector}\n\n"
    issue_dread += "#[DREAD.Score]#\n"
    issue_dread += "#{dread_fixed}\n\n"
    issue_dread += "#[DREAD.Damage]#\n"
    issue_dread += "#{damage}\n\n"
    issue_dread += "#[DREAD.AffectedSystems]#\n"
    issue_dread += "#{affected}\n\n"
    issue_dread += "#[DREAD.Impact]#\n"
    issue_dread += "#{impact_fixed}\n\n"
    issue_dread += "#[DREAD.Reproducibility]#\n"
    issue_dread += "#{repro}\n\n"
    issue_dread += "#[DREAD.Discoverability]#\n"
    issue_dread += "#{disc}\n\n"
    issue_dread += "#[DREAD.ThreatAgent]#\n"
    issue_dread += "#{threat}\n\n"
    issue_dread += "#[DREAD.Exploitability]#\n"
    issue_dread += "#{exploit}\n\n"
    issue_dread += "#[DREAD.Likelihood]#\n"
    issue_dread += "#{likelihood_fixed}\n"

    $('textarea[name=dread_fields]').val(issue_dread)

  _fix: (input) ->
    if $.isNumeric(input) && Math.floor(input) == input
      input
    else
      input.toFixed(3)


document.addEventListener "turbolinks:load", ->
  if $('[data-behavior~=dread-buttons]').length
    DREADCalculator.calculate()
    $('input[type=radio]').on 'change', DREADCalculator.calculate
