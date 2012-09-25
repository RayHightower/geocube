class HomeViewController < UIViewController
  def viewDidLoad
    super
    scroll_frame = view.bounds

    scroll = UIScrollView.alloc.initWithFrame(scroll_frame)
    scroll.pagingEnabled = true
    scroll.contentSize = CGSizeMake(scroll_frame.width * 3, scroll_frame.height)

    3.times do |i|
      subframe = scroll_frame.right(scroll_frame.width * i)
      subview = UIView.alloc.initWithFrame(subframe)
      subview.backgroundColor = [rand * 255, rand * 255, rand * 255].uicolor
      scroll << subview
      header_frame = subview.bounds.down(30).right(30).width(150).height(20)
      header_label = UILabel.alloc.initWithFrame header_frame
      header_label.text = "This is page #{i + 1}"
      header_label.backgroundColor = :clear.uicolor
      subview << header_label

      sublabel = UILabel.alloc.initWithFrame(header_frame.below(100).width(200).centered_in(subframe))
      sublabel.text = "lorem ipsum dolor amet..."
      sublabel.backgroundColor = :clear.uicolor
      subview << sublabel
    end

    view << scroll
  end

  def viewDidUnload
    super
    # Release any retained subviews of the main view.
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end
end
