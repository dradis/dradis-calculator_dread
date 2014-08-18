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


    dread      = (impact + likelihood) / 2

    impact_fixed     = DREADCalculator._fix(impact)
    likelihood_fixed = DREADCalculator._fix(likelihood)
    dread_fixed      = DREADCalculator._fix(dread)

    $('#impact-score').text(impact_fixed)
    $('#likelihood-score').text(likelihood_fixed)
    $('#dread-score').text(dread_fixed)

    issue_dread = "#[DreadValue]#\n"
    issue_dread += "#{dread_fixed}\n\n"
    issue_dread += "#[Damage]#\n"
    issue_dread += "#{damage}\n\n"
    issue_dread += "#[AffectedSystems]#\n"
    issue_dread += "#{affected}\n\n"
    issue_dread += "#[Impact]#\n"
    issue_dread += "#{impact_fixed}\n\n"
    issue_dread += "#[Reproducibility]#\n"
    issue_dread += "#{repro}\n\n"
    issue_dread += "#[Discoverability]#\n"
    issue_dread += "#{disc}\n\n"
    issue_dread += "#[ThreatAgent]#\n"
    issue_dread += "#{threat}\n\n"
    issue_dread += "#[Exploitability]#\n"
    issue_dread += "#{exploit}\n\n"
    issue_dread += "#[Likelihood]#\n"
    issue_dread += "#{likelihood_fixed}\n"
    $('#blob').text(issue_dread)

  _fix: (input) ->
    if $.isNumeric(input) && Math.floor(input) == input
      input
    else
      input.toFixed(3)


jQuery ->
  $('input[type=radio]').on 'change', DREADCalculator.calculate