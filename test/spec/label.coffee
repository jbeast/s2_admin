# global describe, it
define ['models/label'], (LabelModel) ->

  describe 'Label Model', () ->
    describe 'Validation of EAN13 labels', () ->

      it 'validates EAN13s', () ->
        label = new LabelModel { type: 'ean13' }
        cb = sinon.spy()

        label.on 'invalid', cb
        label.set { 'value': 1234 }, { validate: true }

        expect(cb).to.have.been.called
        expect(label.validationError).to.contain('Validation Error')

        # The good ones
        label.set {'value': 123456789101}
        expect(label.isValid()).to.be.true

        label.set {'value': 1234567891011}
        expect(label.isValid()).to.be.true

        # The bad ones
        label.set {'value': 12345678910112}
        expect(label.isValid()).to.be.false

        label.set {'value': 'B12345678911'}
        expect(label.isValid()).to.be.false

        label.set {'value': 'CCCCCCCCCCCC'}
        expect(label.isValid()).to.be.false

      it 'validates 2D barcodes', () ->
        label = new LabelModel { type: 'ean13' }

        label.set {'value': 'FR01798886'}
        expect(label.isValid()).to.be.true

        label.set {'value': 'FR01799062'}
        expect(label.isValid()).to.be.true

        # The bad ones
        label.set {'value': 'FR017990623'}
        expect(label.isValid()).to.be.false

        label.set {'value': 'R01799062'}
        expect(label.isValid()).to.be.false

        label.set {'value': 'CCCCCCCCCCCC'}
        expect(label.isValid()).to.be.false

      it 'validates Sanger Labels', () ->
        label = new LabelModel { type: 'sanger label' }
        cb = sinon.spy();

        label.on 'invalid', cb
        label.set { 'value': 1234 }, { validate: true }

        expect(cb).to.have.been.called
        expect(label.validationError).to.contain('Validation Error')

        label.set { 'value': 'CL0331812C' }
        expect(label.isValid()).to.be.true

        label.set { 'value': 'JR0332748V' }
        expect(label.isValid()).to.be.true

        label.set { 'value': 'JR0333890H' }
        expect(label.isValid()).to.be.true

        label.set { 'value': 'BFDSDF12345678911' }
        expect(label.isValid()).to.be.false

        label.set {'value': 'CCCCCCCCCCCC'}
        expect(label.isValid()).to.be.false