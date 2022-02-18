test = {
  'name': 'without-duplicates',
  'points': 1,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          scm> (without-duplicates (list 5 4 2))
          170ffebdc7f915c38c8aa15d87f696ae
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          scm> (without-duplicates (list 5 4 5 4 2 2))
          170ffebdc7f915c38c8aa15d87f696ae
          # locked
          scm> (without-duplicates (list 5 5 5 5 5))
          a34738f609498a74df607429424c3fe2
          # locked
          scm> (without-duplicates ())
          d17487605f66346bf68b6fb7c92f6257
          # locked
          """,
          'hidden': False,
          'locked': True
        },
        {
          'code': r"""
          scm> (without-duplicates '(5 4 3 2 1))
          (5 4 3 2 1)
          scm> (without-duplicates '(5 4 3 2 1 1))
          (5 4 3 2 1)
          scm> (without-duplicates '(5 5 4 3 2 1))
          (5 4 3 2 1)
          scm> (without-duplicates '(12))
          (12)
          scm> (without-duplicates '(1 1 1 1 1 1))
          (1)
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': True,
      'setup': r"""
      scm> (load-all ".")
      """,
      'teardown': '',
      'type': 'scheme'
    }
  ]
}
