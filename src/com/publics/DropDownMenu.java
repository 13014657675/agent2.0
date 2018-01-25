package com.publics;
import java.io.IOException;
import javax.servlet.jsp.*;
import net.sf.navigator.displayer.MenuDisplayerMapping;
import net.sf.navigator.displayer.MessageResourcesMenuDisplayer;
import net.sf.navigator.menu.MenuComponent;
public class DropDownMenu extends MessageResourcesMenuDisplayer {
	public DropDownMenu() {
	}
	public void init(PageContext pageContext, MenuDisplayerMapping mapping) {
		super.init(pageContext, mapping);
		StringBuffer sb = new StringBuffer();
		sb.append(displayStrings.getMessage("smd.style", "{", "}"));
		sb.append(displayStrings.getMessage("dd.js.start"));
		sb.append(displayStrings.getMessage("dd.js.image.src.expand",
				displayStrings.getMessage("dd.image.src.expand")));
		sb.append(displayStrings.getMessage("dd.js.image.src.expanded",
				displayStrings.getMessage("dd.image.src.expanded")));
		sb.append(displayStrings.getMessage("dd.js.toggle.display", "{", "}"));
		sb.append(displayStrings.getMessage("dd.js.end"));
		try {
			out.print(sb.toString());
		} catch (Exception e) {
		}
	}
	public void display(MenuComponent menu) throws JspException, IOException {
		String title = super.getMessage(menu.getTitle());
		StringBuffer sb = new StringBuffer();
		String img = "";
		if (menu.getImage() != null)
			img = displayStrings.getMessage("dd.image", menu.getImage());
		if (pan(menu)) {
			MenuComponent components[] = menu.getMenuComponents();
			sb.append(displayStrings.getMessage("dd.menu.top"));

			if (components.length > 0) {
				if (isAllowed(menu)) {
					sb.append(displayStrings.getMessage("dd.menu.expander",
							menu.getName(), menu.getName() + "_img",
							displayStrings.getMessage("dd.image.expander", menu
									.getName()
									+ "_img", displayStrings
									.getMessage("dd.image.src.expand"))
									+ "&nbsp;" + img + title));
					displayComponents(menu, sb);
					sb.append(displayStrings.getMessage("dd.menu.restore", menu
							.getName(), menu.getName() + "_img"));
				} else {
					sb.append(displayStrings.getMessage("dd.menu.restricted",
							menu.getName(), menu.getName() + "_img",
							displayStrings.getMessage("dd.image.expander", menu
									.getName()
									+ "_img", displayStrings
									.getMessage("dd.image.src.expand"))
									+ "&nbsp;" + img + title));
				}
			} else {
				sb.append(title);
			}

			sb.append(displayStrings.getMessage("dd.menu.bottom"));
		}
		out.println(sb.toString());
	}
	private boolean pan(MenuComponent menu) {
		if (!isAllowed(menu))
			return false;
		MenuComponent components[] = menu.getMenuComponents();
		if (menu.getMenuComponents().length > 0) {
			for (int a1 = 0; a1 < components.length; a1++) {
				if (isAllowed(components[a1]))
					return true;
			}
			return false;
		} else
			return true;
	}
	private void displayComponents(MenuComponent menu, StringBuffer sb)
			throws JspException, IOException {
		String title = null;
		String name = menu.getName();
		String href = "";
		String img = "";
		if (pan(menu)) {
			MenuComponent components[] = menu.getMenuComponents();

			sb.append(displayStrings.getMessage("dd.menu.item.top", name));
			for (int i = 0; i < components.length; i++) {
				if (pan(components[i])) {
					title = super.getMessage(components[i].getTitle());
					if (components[i].getImage() != null)
						img = displayStrings.getMessage("dd.image",
								components[i].getImage());
					else
						img = "";
					href = components[i].getUrl();

					sb.append(displayStrings
							.getMessage("dd.menu.item.row.start"));
					if (components[i].getMenuComponents().length > 0) {
						if (isAllowed(components[i])) {
							sb
									.append(displayStrings
											.getMessage(
													"dd.menu.expander",
													components[i].getName(),
													components[i].getName()
															+ "_img",
													displayStrings
															.getMessage(
																	"dd.image.expander",
																	components[i]
																			.getName()
																			+ "_img",
																	displayStrings
																			.getMessage("dd.image.src.expand"))
															+ "&nbsp;"
															+ img
															+ title));
							displayComponents(components[i], sb);
							sb.append(displayStrings.getMessage(
									"dd.menu.restore", components[i].getName(),
									components[i].getName() + "_img"));
						} else {
							sb
									.append(displayStrings
											.getMessage(
													"dd.menu.restricted",
													components[i].getName(),
													components[i].getName()
															+ "_img",
													displayStrings
															.getMessage(
																	"dd.image.expander",
																	components[i]
																			.getName()
																			+ "_img",
																	displayStrings
																			.getMessage("dd.image.src.expand"))
															+ "&nbsp;"
															+ img
															+ title));
						}
					} else if (isAllowed(components[i])) {
						href = href.replace('@', '&');
						sb.append(displayStrings.getMessage("dd.link.start",
								href, super.getMenuToolTip(components[i])));
						sb.append("&nbsp;");
						sb.append("&nbsp;");
						sb.append(img);
						sb.append(title);
						sb.append(displayStrings.getMessage("dd.link.end"));
					} else {
						sb.append(displayStrings.getMessage(
								"dd.link.restricted", href, super
										.getMenuTarget(components[i]), super
										.getMenuToolTip(components[i])));
					}
					sb
							.append(displayStrings
									.getMessage("dd.menu.item.row.end"));
				}
			}
			sb.append(displayStrings.getMessage("dd.menu.item.bottom"));
		}
	}
}